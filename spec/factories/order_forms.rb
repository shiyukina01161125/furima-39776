FactoryBot.define do
  factory :order_form do

    post_code          { '111-1111' }
    delivery_area_id   { '2' }
    municipality        { '渋谷区' }
    street_address  { '1-1-1' }
    building_name { 'テックキャンプ' }
    telephone_number   { '0901234567' }
    token              {'ch_a93bb81d177c89541024815de2991'}
  end
end