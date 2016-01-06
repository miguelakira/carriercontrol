class Car < ActiveRecord::Base
  extend EnumerateIt
  PLATE_REGEX = /^[a-zA-Z]{3}\-\d{4}$/
  BUYER_TYPES = %w(Person Company)

  has_enumeration_for :delivery_status, with: DeliveryStatus, create_helpers: true

  belongs_to :buyer, polymorphic: true
  accepts_nested_attributes_for :buyer

  default_scope { order "created_at DESC" }

  before_validation :uppercase_plates
  after_initialize :set_purchase_date_to_today, if: :new_record?

  validates :plate, presence: true, uniqueness: true
  validates :model, presence: true
  validate :plate_must_be_valid
  validate :end_date_must_be_after_purchase_date, if: lambda{ |object| object.expected_end_date.present? }

  def build_buyer(params = nil)
    raise "Unknown buyer_type: #{buyer_type}" unless BUYER_TYPES.include?(buyer_type)
    self.buyer = buyer_type.constantize.new(params)
  end

  private
  def plate_must_be_valid
    errors.add(:plate, "precisa estar no formato XXX-1234 (3 letras, traço, 4 números)") unless plate.match(PLATE_REGEX)
  end

  def uppercase_plates
    plate.upcase!
  end

  def set_purchase_date_to_today
    self.purchase_date = Date.today
  end

  def end_date_must_be_after_purchase_date
    errors.add(:expected_end_date, "precisa ser posterior a #{purchase_date} (data da compra)") if expected_end_date < purchase_date
  end
end
