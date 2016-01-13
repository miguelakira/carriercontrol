class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.string :rg
      t.string :cpf
      t.string :cellphone

      t.timestamps null: false
    end
  end
end
