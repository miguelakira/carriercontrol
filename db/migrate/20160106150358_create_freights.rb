class CreateFreights < ActiveRecord::Migration
  def change
    create_table :freights do |t|
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :ferry, precision: 8, scale: 2
      t.decimal :platform, precision: 8, scale: 2
      t.decimal :redispatching, precision: 8, scale: 2
      t.decimal :platform_origin, precision: 8, scale: 2
      t.decimal :platform_destination, precision: 8, scale: 2
      t.decimal :discount, precision: 8, scale: 2
      t.string :observation
      t.belongs_to :car, index: true

      t.timestamps null: false
    end
  end
end
