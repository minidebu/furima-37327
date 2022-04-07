class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :move_to_index
    before_action :set_item 

  def index
    @buyer_buy_record = BuyerBuyRecord.new
    
  end

  def create
    @buyer_buy_record = BuyerBuyRecord.new(buy_params)
    if @buyer_buy_record.valid?
      pay_item
      @buyer_buy_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buyer_buy_record).permit(:post_code, :prefecture_id, :municipality, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id]
    ).merge(token: params[:token])
  end

  def move_to_index
    item = Item.find(params[:item_id])
    redirect_to root_path if BuyRecord.exists?(item_id: item.id) || item.user_id == current_user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
