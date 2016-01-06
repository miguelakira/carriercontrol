class AddObservationToCar < ActiveRecord::Migration
  def change
    add_column :cars, :observation, :string
  end
end
