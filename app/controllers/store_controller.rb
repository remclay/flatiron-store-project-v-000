class StoreController < ApplicationController

  def index
    #root
    @categories = Category.all
    @items = Item.all
  end
end
