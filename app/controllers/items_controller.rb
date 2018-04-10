class ItemsController < ApplicationController
<<<<<<< HEAD

  def show
    @item = Item.find_by(id: params[:id])
=======
  def show
    @item = Item.find(params[:id])
>>>>>>> 75e99cc36bf9088efca1f5e2c6ae583ce3146a26
  end
end
