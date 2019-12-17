class UserFoodTrackFavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    food_track = FoodTrack.find(params[:food_track_id])
    current_user.food_track_favorite(food_track)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to food_track
  end

  def destroy
    food_track = FoodTrack.find(params[:food_track_id])
    current_user.food_track_unfavorite(food_track)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to food_track
  end
end
