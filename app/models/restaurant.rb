class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :restaurant_zones
  #has_many :zones, through: :restaurant_zones
  belongs_to :user
  
  validates :name, presence: true
  validates_associated :user
end
