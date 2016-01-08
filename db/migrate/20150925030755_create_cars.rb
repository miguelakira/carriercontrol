class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :plate
      t.string :model
      t.references :client, polymorphic: true, index: true

      t.timestamps null: false
    end

  end
end
