class DateRestaurantZone < ApplicationRecord
  #this is a linking table for date,restaurant, and zone
  belongs_to :delivery_date
  belongs_to :restaurant
  belongs_to :delivery_zone
  
  #validates_associated :restaurant, :delivery_zone, :delivery_date
end