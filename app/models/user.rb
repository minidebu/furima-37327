class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :kana_fname
    validates :kana_lname
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }, allow_blank: true do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナを入力してください' }, allow_blank: true do
    validates :kana_fname
    validates :kana_lname
  end
end
