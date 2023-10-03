FactoryBot.define do
  factory :address do
    association :order
    
    post_code          { '111-1111' }
    delivery_area_id   { '2' }
    municipality        { '渋谷区' }
    street_address  { '1-1-1' }
    building_name { 'テックキャンプ' }
    telephone_number   { '0901234567' }

    
    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
