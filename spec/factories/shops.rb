FactoryBot.define do
  factory :shop do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    shop_name { Faker::Lorem.characters(number: 10) }
    shop_name_kana { Faker::Lorem.characters(number: 20) }
    postal_code { Faker::Lorem.characters(number: 7) }
    address { Faker::Lorem.characters(number: 8) }
    telephone_number { Faker::Lorem.characters(number: 10) }
    opening_hours { Faker::Lorem.characters(number: 10) }
    holiday { Faker::Lorem.characters(number: 10) }
    introduction { Faker::Lorem.characters(number: 20) }
    image_id { Faker::Lorem.characters(number: 8) }
    genre { Faker::Lorem.characters(number: 6) }
    reserve { 0 }
    parking_space { 5 }
    payment_method { Faker::Lorem.characters(number: 10) }
    smoking { Faker::Lorem.characters(number: 10) }
    private_room { "true" }
    ticket { "false" }
    children { Faker::Lorem.characters(number: 10) }
    wait_time { Faker::Lorem.characters(number: 10) }
    access { Faker::Lorem.characters(number: 10) }
    is_deleted { "false" }
  end
end