class CreateFinances < ActiveRecord::Migration
  def change
    create_table :finances do |t|
      t.references :client, polymorphic: true, index: true, null: false
      t.timestamps null: false
    end
  end
end
