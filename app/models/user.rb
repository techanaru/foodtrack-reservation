class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :user_food_track_favorites
  has_many :food_track_favorites, through: :user_food_track_favorites, source: :food_track
  has_many :reservations
  has_many :food_menu_reservations, through: :reservations, source: :food_menu, dependent: :destroy
  
  #トラックのお気に入り
  def food_track_favorite(food_track)
      self.user_food_track_favorites.find_or_create_by(food_track_id: food_track.id)
  end

  def food_track_unfavorite(food_track)
    favorite = self.user_food_track_favorites.find_by(food_track_id: food_track.id)
    favorite.destroy if favorite
  end
  
  def food_track_favorite?(food_track)
    self.food_track_favorites.include?(food_track)
  end
  

#メニューの予約
  def food_menu_reservation(food_menu)
      self.reservations.find_or_create_by(food_menu_id: food_menu.id)
  end
  
  def food_menu_reservation_cancel(food_menu)
    reservation = self.reservations.find_by(food_menu_id: food_menu.id)
    reservation.destroy if reservation
  end
  
  def food_menu_reservation?(food_menu)
    self.food_menu_reservations.include?(food_menu)
  end
  
end
