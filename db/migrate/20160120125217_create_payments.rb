class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :value, precision: 8, scale: 2, null: false
      t.string :type
      t.date :fulfilled_at
      t.boolean :fulfilled
      t.date :will_be_fulfilled_at
      t.references :finance, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :payments, :finances
  end
end
