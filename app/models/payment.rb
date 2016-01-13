class Payment < ActiveRecord::Base
  belongs_to :client, polymorphic: true
  belongs_to :car

  validates :value, presence: true
end
