class Payment < ActiveRecord::Base
  belongs_to :finance

  validates :value, presence: true
  validates :finance, presence: true
end
