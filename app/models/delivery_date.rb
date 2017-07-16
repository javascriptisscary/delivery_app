class DeliveryDate < ApplicationRecord
  has_many :date_restaurant_zones
  has_many :restaurants, through: :date_restaurant_zones
  has_many :delivery_zones, through: :date_restaurant_zones
  
  #todo validate date format/validity
  validates_date :delivery_date, on_or_after: lambda {Date.current}, type: :date

end
