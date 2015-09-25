class Company < ActiveRecord::Base
  has_many :cars, as: :buyer
end
