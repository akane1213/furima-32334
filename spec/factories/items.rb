FactoryBot.define do
  factory :item do
    product_name { 'test' }
    product_description { "test" }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_charges_id { 2 }
    shipping_area_id { 2 }
    days_to_ship_id { 2 }
    price { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
