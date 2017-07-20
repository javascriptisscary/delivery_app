class Zone < ApplicationRecord
  has_many :restaurant_zones
  has_many :restaurants, through: :restaurant_zones
  
  validates :name, presence: true, uniqueness: true
end
