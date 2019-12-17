class FoodTrack < ApplicationRecord
  has_many :food_menus
  has_many :user_food_track_favorites
  has_many :user_favorites, through: :user_food_track_favorites, source: :user
  has_many :track_place_relationships
  has_many :place_relationships, through: :track_place_relationships, source: :selling_place
  mount_uploader :image, ImageUploader
  
  #トラックの販売所を登録
  def selling_place_registration(selling_place)
      self.track_place_relationships.find_or_create_by(selling_place_id: selling_place.id)
  end

  def selling_place_unregistration(selling_place)
    registration = self.track_place_relationships.find_by(selling_place_id: selling_place.id)
    registration.destroy if registration
  end
  
  def selling_place_registration?(selling_place)
    self.place_relationships.include?(selling_place)
  end
  
end

