class Person < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :payments, as: :client
  has_many :freights, as: :client

  accepts_nested_attributes_for :payments, :freights

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validate :cpf_must_be_valid

  def document
    cpf
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

  private
  def cpf_must_be_valid
    errors.add(:cpf, "precisa ser válido") unless CPF.valid? cpf
  end
end
