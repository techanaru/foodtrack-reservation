class ReservationsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    food_menu = FoodMenu.find(params[:food_menu_id])
    current_user.food_menu_reservation(food_menu)
    flash[:success] = '予約しました。'
    redirect_to food_menu
  end

  def destroy
    food_menu = FoodMenu.find(params[:food_menu_id])
    current_user.food_menu_reservation_cancel(food_menu)
    flash[:success] = '予約キャンセルしました。'
    redirect_to food_menu
  end
end
