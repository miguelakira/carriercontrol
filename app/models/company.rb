class Company < ActiveRecord::Base
  has_many :cars, as: :buyer

  def documents
    { cnpj: cnpj }
  end

  def document_name
    "cnpj"
  end
end
