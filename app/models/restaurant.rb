class Restaurant < ApplicationRecord
  has_many :meals
  #has_many :delivery_zones, through: :delivery_dates
  #has_many :delivery_dates
  
  has_many :date_restaurant_zones
  has_many :delivery_dates, through: :date_restaurant_zones
  has_many :delivery_zones, through: :date_restaurant_zones
  
  validates :name, presence: true, uniqueness: true
end
