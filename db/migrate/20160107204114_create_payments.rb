class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :value, precision: 8, scale: 2
      t.string :type
      t.date :fulfilled_at
      t.boolean :fulfilled
      t.date :will_be_fulfilled_at
      t.references :client, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
