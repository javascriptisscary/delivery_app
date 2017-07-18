class DeliveryDate < ApplicationRecord
  has_many :meals
  has_many :restaurants, through: :meals
  has_many :delivery_zones, through: :meals
  
  #todo validate date format/validity
  validates_date :delivery_date, on_or_after: lambda {Date.current}, type: :date

end
