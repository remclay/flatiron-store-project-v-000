class StoreController < ApplicationController

  def index
    #root
    @categories = Category.all
    @items = Item.with_inventory
  end
end
