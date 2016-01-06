class ChangeCompanyNameToLegalNameInCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :company_name, :legal_name
  end
end
