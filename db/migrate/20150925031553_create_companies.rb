class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :phone
      t.string :email
      t.string :name
      t.string :cnpj
      t.string :company_name

      t.timestamps null: false
    end
  end
end
