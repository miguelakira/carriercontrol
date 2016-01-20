class Finance < ActiveRecord::Base
  has_many :payments
  belongs_to :client, polymorphic: true

  accepts_nested_attributes_for :payments

  def total_debt
    client.freights.map(&:total).sum
  end

  def total_payments
    payments.map(&:value).sum
  end
end
