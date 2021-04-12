class FurimasController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @furima = Item.new
  end

  def create
    @furima = Item.new
  end
end
