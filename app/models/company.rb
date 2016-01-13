class Company < ActiveRecord::Base
  has_many :cars, as: :client
  has_many :payments, as: :client

  accepts_nested_attributes_for :payments

  validates :phone, presence: true
  validates :name, presence: true
  validates :email, presence: true

  def documents
    { cnpj: cnpj }
  end

  def document_name
    "cnpj"
  end
end
