FactoryBot.define do
  factory :customer do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    last_name { Faker::Lorem.characters(number: 2) }
    first_name { Faker::Lorem.characters(number: 2) }
    last_name_kana { Faker::Lorem.characters(number: 5) }
    first_name_kana { Faker::Lorem.characters(number: 3) }
    postal_code { Faker::Lorem.characters(number: 7) }
    address { Faker::Lorem.characters(number: 7) }
    telephone_number { Faker::Lorem.characters(number: 10) }
    is_deleted { "false" }
  end
end