FactoryBot.define do
  factory :item do
    association :user

    item_name          {'MacbookPro'}
    item_explanation   {'展示品特価'}
    category_id        {'2'}
    item_situation_id  {'2'}
    delivery_charge_id {'2'}
    delivery_area_id   {'2'}
    delivery_day_id    {'2'}
    price              {'500'}
    
    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

