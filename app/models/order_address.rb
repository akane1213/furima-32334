class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :order_id


  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
  end

  with_options numericality: { other_than: 1 } do
    validates :shipping_area_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end