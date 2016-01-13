class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :phone, null: false
      t.string :email, null: false
      t.string :name, null: false
      t.string :company_name
      t.string :cnpj
      t.string :cellphone

      t.timestamps null: false
    end
  end
end
