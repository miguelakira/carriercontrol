class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :car, index: true
      t.belongs_to :origin, class_name: "Cities", index: true
      t.belongs_to :destination, class_name: "Cities", index: true
      t.belongs_to :current, class_name: "Cities", index: true

      t.timestamps null: false
    end
  end
end
