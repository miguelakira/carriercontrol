class Location < ActiveRecord::Base
  belongs_to :car
  belongs_to :origin, foreign_key: "origin_id", class_name: "City"
  belongs_to :destination, foreign_key: "destination_id", class_name: "City"
  belongs_to :current, foreign_key: "current_id", class_name: "City"

  delegate :state, to: :origin, prefix: :origin, allow_nil: true
  delegate :state, to: :destination, prefix: :destination, allow_nil: true
  delegate :state, to: :current, prefix: :current, allow_nil: true

  def full(method)
    raise MethodNotFound unless [:origin, :destination, :current].include? method
    city = self.send method
    "#{city.name.titleize}, #{city.state.acronym}" if city
  end

  def as_json(options={})
    super(
      include: {
        origin_state: { only: [:id] },
        destination_state: { only: [:id] },
        current_state: { only: [:id] }
      }
    )
  end
end
