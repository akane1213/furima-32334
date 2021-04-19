class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :item_to_index, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charges_id,
                                 :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_to_index
    @item = Item.find(params[:id])
    unless  current_user == @item.user
      redirect_to root_path
    end
  end
end
