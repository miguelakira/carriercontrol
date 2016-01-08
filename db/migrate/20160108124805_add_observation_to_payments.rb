class AddObservationToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :observation, :string
  end
end
