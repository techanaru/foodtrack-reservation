class UserFoodTrackFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :food_track
end
