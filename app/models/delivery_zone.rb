class DeliveryZone < ApplicationRecord
  has_many :restaurants
  has_many :meals, through: :restaurants
  
  validates :name, presence: true, uniqueness: true
end
