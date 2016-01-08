class AddClientToFreights < ActiveRecord::Migration
  def change
    add_column :freights, :client_id, :integer
    add_column :freights, :client_type, :string

    add_index :freights, :client_id
  end
end
