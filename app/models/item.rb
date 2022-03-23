class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :postage_by
  belongs_to :shipping_days

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id 
    validates :status_id  
    validates :prefecture_id
    validates :postage_by_id
    validates :shipping_days_id
  end

  validates :name ,presence: true
  validates :info ,presence: true
end

