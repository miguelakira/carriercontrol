class AddDatesToCars < ActiveRecord::Migration
  def change
    add_column :cars, :expected_end_date, :date
    add_column :cars, :purchase_date, :date
    add_column :cars, :delivery_date, :date
  end
end
