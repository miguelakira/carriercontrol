class Person < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :payments, as: :client
  has_many :freights, as: :client

  accepts_nested_attributes_for :payments, :freights

  def documents
    { rg: rg, cpf: cpf }
  end

  def document_name
    "cpf"
  end

  def total_debt
    (self.freights.map {|f| f.total }).sum
  end

  def total_payment
    (self.payments.map {|p| p.value }).sum
  end

  def active_cars

  end
end
