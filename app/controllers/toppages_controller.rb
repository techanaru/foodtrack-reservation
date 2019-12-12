class ToppagesController < ApplicationController
  def index
    @food_menu = FoodMenu.order(id: :desc).page(params[:page]).per(25)
  end
end
