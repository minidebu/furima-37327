FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '山田' }
    kana_fname            { 'タロウ' }
    kana_lname            { 'ヤマダ' }
    birthday              { Faker::Date.backward }
  end
end
