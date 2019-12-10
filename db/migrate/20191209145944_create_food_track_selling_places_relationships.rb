class CreateFoodTrackSellingPlacesRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :food_track_selling_places_relationships do |t|
      t.references :selling_place, foreign_key: { to_table: :selling_places }
      t.references :food_track, foreign_key: { to_table: :food_tracks }

      t.timestamps
      
      t.index [:selling_place_id, :food_track_id], unique: true
    end
  end
end
