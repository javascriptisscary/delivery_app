class Restaurant < ApplicationRecord
  has_many :meals
  belongs_to :delivery_zone
  
  validates :name, presence: true
end
