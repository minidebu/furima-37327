FactoryBot.define do
  factory :item do
    name                { Faker::Name }
    info                { Faker::Lorem.sentence }
    category_id         { rand(2..10) }
    status_id           { rand(2..7) }
    prefecture_id       { rand(2..10) }
    postage_by_id       { rand(2..48) }
    shipping_days_id    { rand(2..4) }
    price               { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test_image.png')
    end
  end
end
