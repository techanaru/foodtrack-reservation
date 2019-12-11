class TrackPlacesRelationship < ApplicationRecord
  belongs_to :selling_place
  belongs_to :food_track
end
