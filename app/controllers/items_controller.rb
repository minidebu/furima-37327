class ItemsController < ApplicationController
  def index
    @user = User.new
  end




  def item_params
    params.require(:item).permit(:name,:info,:category_id,:status_id,:prefecture_id,:postage_by_id,:price,:image)
  end
end
