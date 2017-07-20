class RestaurantZone < ApplicationRecord
  belongs_to :restaurant
  belongs_to :zone
  
  validates_date :delivery_date, on_or_after: lambda { Date.current }
  validates_associated :restaurant, :zone
end