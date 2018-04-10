class LineItemsController < ApplicationController

  def create
    if current_user
      if current_user.current_cart
        add_item
      else
        current_user && current_user.current_cart = Cart.create(user_id: current_user.id)
        current_user.save
        add_item
      end
      redirect_to cart_path(current_user.current_cart)
    else
      redirect_to new_user_session_path
    end
  end

  def add_item
    @item = Item.find_by(id: params[:item_id])
    line_item_ids = current_user.current_cart.line_item_ids
    if line_item_ids.include?(@item.id)
      existing_line_item = current_user.current_cart.line_items.find_by(id: @item.id)
      existing_line_item.quantity += 1
      existing_line_item.save
    else
      current_user.current_cart.line_items.create(item_id: params[:item_id], quantity: 1)
    end
  end
end
