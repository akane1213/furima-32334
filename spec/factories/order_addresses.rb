FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    municipality { '東京都渋谷区' }
    address { '青山1-1-1' }
    phone_number { '09012345678' }
  end
end
