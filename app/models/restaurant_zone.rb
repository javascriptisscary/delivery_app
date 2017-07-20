class RestaurantZone < ApplicationRecord
  belongs_to :restaurant
  belongs_to :zone
  
  validates :delivery_date, presence: true
end