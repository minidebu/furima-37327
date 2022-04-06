FactoryBot.define do
  factory :buyer_buy_record do
    post_code       { '111-1111' }
    prefecture_id   { rand(2..10) }
    municipality    { '愛媛県' }
    address         { '1-1' }
    building        { '建物' }
    phone           { rand(1_000_000_000..99_999_999_999) }
    token           { 'token7491u9874928392' }
  end
end
