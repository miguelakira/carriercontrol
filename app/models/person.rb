class Person < ActiveRecord::Base
  has_many :cars, as: :buyer

  # validate cpf

  def documents
    { rg: rg, cpf: cpf }
  end

  def document_name
    "cpf"
  end
end
