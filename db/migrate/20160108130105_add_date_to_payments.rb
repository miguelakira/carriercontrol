class AddDateToPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :will_be_fulfilled_at

    add_column :payments, :date, :date
  end
end
