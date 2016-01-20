class AddClientToFreights < ActiveRecord::Migration
  def change
    add_column :freights, :client_id, :integer, null: false
    add_column :freights, :client_type, :string, null: false

    add_index :freights, :client_id
  end
end
