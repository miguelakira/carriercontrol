class Finance < ActiveRecord::Base
  has_many :payments
  belongs_to :client, polymorphic: true

  def total_debt
    client.freights.map(&:total).sum
  end

  def total_payments
    payments.map(&:value).sum
  end
end
