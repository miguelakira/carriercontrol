class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone
      t.string :email
      t.string :name
      t.string :rg
      t.string :cpf

      t.timestamps null: false
    end
  end
end
