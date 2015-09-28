class Car < ActiveRecord::Base
  extend EnumerateIt

  has_enumeration_for :delivery_status, with: DeliveryStatus, create_helpers: true

  belongs_to :buyer, polymorphic: true

  validates :plate, presence: true, uniqueness: true
  validates :model, presence: true

  def as_json(options={})
    super(
      include: {
        buyer: { only: [:id, :name, :cpf, :cnpj] },
      }
    )
  end
end
