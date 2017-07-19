class Restaurant < ApplicationRecord
  has_many :meals, dependent: :destroy
  belongs_to :delivery_zone
  belongs_to :user
  
  validates :name, presence: true
  validates_associated :user
end
