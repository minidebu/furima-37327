class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = User.new
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :prefecture_id, :postage_by_id, :shipping_days_id, :price,
                                 :image).merge(user_id: current_user.id)
  end
end
