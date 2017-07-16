class DeliveryZone < ApplicationRecord
  has_many :date_restaurant_zones
  has_many :restaurants, through: :date_restaurant_zones
  has_many :delivery_dates, through: :date_restaurant_zones
  
  validates :name, presence: true, uniqueness: true
end
