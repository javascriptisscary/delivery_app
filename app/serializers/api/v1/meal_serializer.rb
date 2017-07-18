class Api::V1::MealSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :restaurant
  
  def created_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end
  
  def updated_at
    object.created_at.in_time_zone.iso8601 if object.created_at
  end
end