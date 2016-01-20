class Freight < ActiveRecord::Base
  belongs_to :car
  belongs_to :client, polymorphic: true

  before_save :freight_belongs_to_client

  def total
    discount_value = (discount || 0) * -1
    [subtotal, ferry, platform, redispatching, platform_origin, platform_destination, discount_value].compact.sum
  end

  private
  def freight_belongs_to_client
    self.client = self.car.client
  end
end
