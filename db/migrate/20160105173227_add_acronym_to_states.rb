class AddAcronymToStates < ActiveRecord::Migration
  def change
    remove_column :states, :abbreviation
    add_column :states, :acronym, :string
  end
end
