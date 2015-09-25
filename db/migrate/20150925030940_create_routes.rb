class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :origin_id
      t.integer :destination_id
      t.integer :current_location_id
      t.integer :car_id

      t.timestamps null: false
    end

    add_index :routes, :car_id
    add_index :routes, :destination_id
    add_index :routes, :current_location_id
  end
end
