class BuyersBuyRecord
  include ActiveModel::Model
  atter_accessor :post_code ,:prefecture_id ,:municipality,:address,:building,:phone,:buy_record_id,:user_id,:item_id


  with_options presence: true do
    validates :post_code ,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"},allow_blank: true
    validates :prefecture_id 
    validates :municipality
    validates :address
    validates :phone ,numericality: {only_integer: true}, length: { in: 10..11 },allow_blank: true
    validates :buy_record_id
    validates :user_id
    validates :item_id
  end


  private


end