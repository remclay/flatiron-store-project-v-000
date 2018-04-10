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
    line_item_ids = current_user.current_cart.items.ids
    if line_item_ids.include?(@item.id)
      current_items = current_user.current_cart.line_items
      current_item = current_items.find_by(item_id: @item.id)
      current_item.quantity += 1
      current_item.save
    else
      current_user.current_cart.line_items.create(item_id: params[:item_id], quantity: 1)
    end
  end
end
