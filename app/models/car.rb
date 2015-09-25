class Car < ActiveRecord::Base
  belongs_to :buyer, polymorphic: true

  validates :plate, presence: true, uniqueness: true
  validates :model, presence: true



end
