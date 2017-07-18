class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  belongs_to :delivery_zone
  
  validates :name, presence: true
end
