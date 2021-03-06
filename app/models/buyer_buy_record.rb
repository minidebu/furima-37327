class BuyerBuyRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building,
                :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code
    validates :phone
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :phone, numericality: { only_integer: true }, length: { in: 10..11 }, allow_blank: true
  validates :prefecture_id, numericality: { other_than: 1 }, allow_blank: true
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }, allow_blank: true

  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building,
                 phone: phone, buy_record_id: buy_record.id)
  end
end
  