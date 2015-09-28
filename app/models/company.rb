class Company < ActiveRecord::Base
  has_many :cars, as: :buyer

  def documents
    { cnpj: cnpj }
  end
end
