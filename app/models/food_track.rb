class FoodTrack < ApplicationRecord
  has_many :food_menus
  has_many :user_food_track_favorites
  has_many :user_favorites, through: :user_food_track_favorites, source: :user
  has_many :food_track_selling_place_relationships
  has_many :selling_place_relationships, through: :food_track_selling_place_relationships, source: :selling_place
end
