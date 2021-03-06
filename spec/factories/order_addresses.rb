FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '東京都渋谷区' }
    address { '青山1-1-1' }
    building_name { '柳生ビル103'}
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
