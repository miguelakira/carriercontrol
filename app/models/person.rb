class Person < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :freights, as: :client
  has_one :finance, as: :client

  accepts_nested_attributes_for :freights

  before_save :create_finance, if: Proc.new { |person| person.finance.nil? }

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validate :cpf_must_be_valid

  delegate :total_payments, to: :finance
  delegate :total_debt, to: :finance
  delegate :balance, to: :finance

  def document
    cpf
  end

  def document_name
    "cpf"
  end

  private
  def cpf_must_be_valid
    errors.add(:cpf, "precisa ser válido") unless CPF.valid? cpf
  end

  def create_finance
    self.finance = Finance.new
  end
end
