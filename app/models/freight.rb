class Freight < ActiveRecord::Base
  belongs_to :car
  belongs_to :client, polymorphic: true

  def total
    discount_value = (discount || 0) * -1
    [subtotal, ferry, platform, redispatching, platform_origin, platform_destination, discount_value].compact.sum
  end
end
