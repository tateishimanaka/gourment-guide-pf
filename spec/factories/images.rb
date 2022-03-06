FactoryBot.define do
  factory :image do
    image_id { Faker::Lorem.characters(number: 8) }
    introduction { Faker::Lorem.characters(number: 20) }
    shop_id { 1 }
  end
end