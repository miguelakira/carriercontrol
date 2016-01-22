class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :plate, null: false
      t.string :model, null: false
      t.references :client, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end

    add_index :cars, :plate, unique: true
  end
end
