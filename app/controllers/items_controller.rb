class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_to_index, only: [:edit, :update, :destroy]

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

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end


  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_condition_id, :shipping_charges_id,
                                 :shipping_area_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_to_index
    unless  current_user == @item.user
      redirect_to root_path
    end
  end
end
