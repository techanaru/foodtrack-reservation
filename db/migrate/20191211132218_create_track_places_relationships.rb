class CreateTrackPlacesRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :track_places_relationships do |t|
      t.references :selling_place, foreign_key: true
      t.references :food_track, foreign_key: true

      t.timestamps
    end
  end
end
