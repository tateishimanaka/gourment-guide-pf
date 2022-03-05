FactoryBot.define do
  factory :menu do
    name { Faker::Lorem.characters(number: 5) }
    image_id { Faker::Lorem.characters(number: 8) }
    price { Faker::Lorem.characters(number: 4) }
    is_active { "true" }
    shop_id { 1 }
  end
end