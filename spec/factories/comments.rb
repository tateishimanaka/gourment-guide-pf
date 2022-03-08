FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number: 30) }
    rate { 2 }
    shop_id { 1 }
    customer_id { 1 }
  end
end