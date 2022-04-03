class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :user
  has_one :buyer
end
