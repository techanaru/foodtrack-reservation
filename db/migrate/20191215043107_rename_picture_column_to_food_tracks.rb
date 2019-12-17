class RenamePictureColumnToFoodTracks < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_tracks, :picture, :image
  end
end
