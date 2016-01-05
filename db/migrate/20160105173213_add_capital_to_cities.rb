class AddCapitalToCities < ActiveRecord::Migration
  def change
    add_column :cities, :capital, :boolean
  end
end
