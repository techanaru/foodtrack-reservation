class FoodMenu < ApplicationRecord
  belongs_to :food_track
  has_many :reservations
  has_many :user_reservations, through: :reservations, source: :user
end
