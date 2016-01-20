class Company < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :freights, as: :client
  has_one :finance, as: :client

  accepts_nested_attributes_for :freights

  before_save :create_finance, if: Proc.new { |company| company.finance.nil? }

  validates :phone, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validate :cnpj_must_be_valid

  delegate :total_debt, to: :finance
  delegate :total_payments, to: :finance

  def document
    cnpj
  end

  def document_name
    "cnpj"
  end

  private
  def cnpj_must_be_valid
    errors.add(:cnpj, "precisa ser válido") unless CNPJ.valid? cnpj
  end

  def create_finance
    self.finance = Finance.new
  end
end
