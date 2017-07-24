class RestaurantZone < ApplicationRecord
  belongs_to :restaurant
  belongs_to :zone
  
  validate :one_restaurant_per_zone_per_date
  validates_date :delivery_date, on_or_after: lambda { Date.current }
  validates_associated :restaurant, :zone
  
  def one_restaurant_per_zone_per_date
    restaurant_zones = RestaurantZone.where(delivery_date: delivery_date, restaurant_id: restaurant.id)
    if restaurant_zones.present?
      errors.add(:restaurant, "can only have one zone per date")
    end
  end
  
end