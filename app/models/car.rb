class Car < ActiveRecord::Base
  extend EnumerateIt
  PLATE_REGEX = /^[a-zA-Z]{3}\-\d{4}$/
  CLIENT_TYPES = %w(Person Company)

  has_enumeration_for :delivery_status, with: DeliveryStatus, create_helpers: true

  has_one :freight
  has_one :location
  belongs_to :client, polymorphic: true
  has_many :payments, through: :client
  accepts_nested_attributes_for :client, :freight

  default_scope { order "created_at DESC" }

  scope :active, -> { where("delivery_status != ?", DeliveryStatus::DELIVERED) }
  scope :inactive, -> { where(delivery_status: DeliveryStatus::DELIVERED) }

  before_validation :uppercase_plates
  after_initialize :set_purchase_date_to_today, if: :new_record?

  validates :plate, presence: true, uniqueness: true
  validates :model, presence: true
  validate :plate_must_be_valid
  validate :end_date_must_be_after_purchase_date, if: lambda{ |object| object.expected_end_date.present? }

  def build_client(params = nil)
    raise "Unknown client_type: #{client_type}" unless CLIENT_TYPES.include?(client_type)
    self.client = client_type.constantize.new(params)
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

  def delivered?
    !!delivery_status
  end
end
