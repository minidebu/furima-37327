class OrdersController < ApplicationController
  def index
    @buyer_buy_record = BuyerBuyRecord.new(item_id:params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def create

    @buyer_buy_record = BuyerBuyRecord.new(buy_params)
    if @buyer_buy_record.valid?
      @buyer_buy_record.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end

  end
  
  private
  def buy_params
    params.require(:buyer_buy_record).permit(:post_code ,:prefecture_id ,:municipality,:address,:building,:phone).merge(user_id:current_user.id,item_id:params[:item_id])
  end
end
