class Car < ActiveRecord::Base
  extend EnumerateIt
  PLATE_REGEX = /^[a-zA-Z]{3}\-\d{4}$/

  has_enumeration_for :delivery_status, with: DeliveryStatus, create_helpers: true

  belongs_to :buyer, polymorphic: true

  default_scope { order "updated_at DESC" }

  validates :plate, presence: true, uniqueness: true
  validate :plate_must_be_valid
  validates :model, presence: true

  before_save :uppercase_plates

  def as_json(options={})
    super(
      include: {
        buyer: { only: [:id, :name, :cpf, :cnpj] },
      }
    )
  end

  private

  def plate_must_be_valid
    errors.add(:plate, "precisa estar no formato XXX-1234 (3 letras, traço, 4 números)") unless plate.match(PLATE_REGEX)
  end

  def uppercase_plates
    plate.upcase!
  end
end
