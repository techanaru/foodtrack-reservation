class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :food_menu
end
