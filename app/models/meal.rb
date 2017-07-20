class Meal < ApplicationRecord
  belongs_to :restaurant
  
  validates :name, presence: true
  validates_associated :restaurant
  
  
end
