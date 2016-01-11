class Location < ActiveRecord::Base
  belongs_to :car
  belongs_to :origin, foreign_key: "origin_id", class_name: "City"
  belongs_to :destination, foreign_key: "destination_id", class_name: "City"
  belongs_to :current, foreign_key: "current_id", class_name: "City"
end
