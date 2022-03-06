FactoryBot.define do
  factory :seat do
    seat_type { Faker::Lorem.characters(number: 10) }
    image_id { Faker::Lorem.characters(number: 8) }
    introduction { Faker::Lorem.characters(number: 15) }
    people { Faker::Lorem.characters(number: 2) }
    smoking { "false" }
    reserve { Faker::Lorem.characters(number: 10) }
    is_active { "true" }
    shop_id { 1 }
  end
end