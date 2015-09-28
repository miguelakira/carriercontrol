class AddDeliveryStatusToCars < ActiveRecord::Migration
  def change
    add_column :cars, :delivery_status, :integer
  end
end
