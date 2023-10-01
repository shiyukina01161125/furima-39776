FactoryBot.define do
  factory :order_form do
    item_id { 1 }
    user_id { 1 }
    post_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    delivery_area_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    telephone_number { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
  end
end