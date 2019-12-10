class CreateUserFoodTrackFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_food_track_favorites do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :food_trask, foreign_key: { to_table: :food_trasks }

      t.timestamps
      
      t.index [:user_id, :food_track_id], unique: true
      
    end
  end
end
