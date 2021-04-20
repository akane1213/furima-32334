class OrdersController < ApplicationController

  def index
    @orders = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
  end

  private
  
  def order_params
    params.require(:order).permit(:user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :order_id)
  end
end
