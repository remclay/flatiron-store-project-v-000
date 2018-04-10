class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout, :update_inventory]
  # before_action :require_login

  def show
  end

  def checkout
    @current_cart.status = "submitted"
    @current_cart.save
    update_inventory
    @user = User.find_by(id: @current_cart.id)
    @user.current_cart = nil
    redirect_to cart_path(@current_cart)
  end

  def update_inventory
    @current_cart.line_items.each do |line_item|
      @item = Item.find_by_id(line_item.item_id)
      @item.inventory -= line_item.quantity
      @item.save
    end
  end

  private

    def set_cart
      @current_cart = Cart.find_by(id: params[:id])
    end
end
