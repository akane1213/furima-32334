class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def sold_out_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
