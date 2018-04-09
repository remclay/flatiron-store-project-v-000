class StoreController < ApplicationController

  def index
    #root
    @categories = Category.all
    @items = Item.available_items
  end
end
