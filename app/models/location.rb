class Location < ActiveRecord::Base
  belongs_to :car
  belongs_to :origin, foreign_key: "origin_id", class_name: "City"
  belongs_to :destination, foreign_key: "destination_id", class_name: "City"
  belongs_to :current, foreign_key: "current_id", class_name: "City"

  def full(method)
    raise MethodNotFound unless [:origin, :destination, :current].include? method
    city = self.send method
    "#{city.name.titleize}, #{city.state.acronym}" if city
  end
end
