FactoryBot.define do
  factory :buyer_buy_record do
    post_code       {'111-1111'}
    prefecture_id   {rand(2..10)}
    municipality    {"愛媛県"}
    address         {"1-1"}
    building        {"建物"}
    phone           {rand(1000000000..99999999999)}
  end
end