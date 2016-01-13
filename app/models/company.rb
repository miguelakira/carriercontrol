class Company < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :payments, as: :client
  has_many :freights, as: :client

  accepts_nested_attributes_for :payments, :freights

  validates :phone, presence: true
  validates :name, presence: true
  validates :email, presence: true

  def document
    cnpj
  end

  def document_name
    "cnpj"
  end

  def total_debt
    (self.freights.map {|f| f.total }).sum
  end

end
