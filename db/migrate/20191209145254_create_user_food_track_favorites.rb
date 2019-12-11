class CreateUserFoodTrackFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_food_track_favorites do |t|
      t.references :user, foreign_key: true
      t.references :food_track, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :food_track_id], unique: true
      
    end
  end
end
