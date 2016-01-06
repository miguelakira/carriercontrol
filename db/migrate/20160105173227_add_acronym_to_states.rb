class AddAcronymToStates < ActiveRecord::Migration
  def change
    rename_column :states, :abbreviation, :acronym
  end
end
