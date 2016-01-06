class AddObservationToCompanyAndPerson < ActiveRecord::Migration
  def change
    add_column :people, :observation, :string
    add_column :companies, :observation, :string
  end
end
