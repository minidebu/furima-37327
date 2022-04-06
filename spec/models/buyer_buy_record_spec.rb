require 'rails_helper'
RSpec.describe BuyerBuyRecord, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_buy_record = FactoryBot.build(:buyer_buy_record, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての入力が正しい時、商品が購入できる' do
        expect(@buyer_buy_record).to be_valid
      end
      it '建物名がなくても、商品が購入できる' do
        @buyer_buy_record.building = ''
        expect(@buyer_buy_record).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号の入が力ない時、商品が購入できない' do
        @buyer_buy_record.post_code = ''
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県の入が力ない時、商品が購入できない' do
        @buyer_buy_record.prefecture_id = 1
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市区町村の入力がない時、商品が購入できない' do
        @buyer_buy_record.municipality = ''
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地の入力がない時、商品が購入できない' do
        @buyer_buy_record.address = ''
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号の入力がない時、商品が購入できない' do
        @buyer_buy_record.phone = ''
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Phone can't be blank")
      end
      it '郵便番号にハイフンがない時、商品が購入できない' do
        @buyer_buy_record.post_code = '1234567'
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号に数字とハイフン以外が入っている時、商品が購入できない' do
        @buyer_buy_record.post_code = 'aiu-eosa'
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '電話番号が10~11桁でなかった時、商品が購入できない' do
        @buyer_buy_record.phone = '125'
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end

      it '電話番号に半角数値以外がある時、商品が購入できない' do
        @buyer_buy_record.phone = 'aiueokaki'
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end
      it 'itemが紐付いていない時、商品が購入できない' do
        @buyer_buy_record.item_id = nil
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていない時、商品が購入できない' do
        @buyer_buy_record.user_id = nil
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("User can't be blank")
      end
      it 'tokenがない時、商品が購入できない' do
        @buyer_buy_record.token = nil
        @buyer_buy_record.valid?
        expect(@buyer_buy_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
