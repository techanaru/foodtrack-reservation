class SellingPlace < ApplicationRecord
  has_many :food_track_selling_place_relationships
  has_many :food_track_relationships, through: :food_track_selling_place_relationships, source: :food_track
end