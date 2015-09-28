class Person < ActiveRecord::Base
  has_many :cars, as: :buyer

  def documents
    {rg: rg, cpf: cpf}
  end
end
