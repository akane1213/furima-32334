class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @furima = Item.new
  end

  def create
    @furima = Item.new(item_params)
    if @furima.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
