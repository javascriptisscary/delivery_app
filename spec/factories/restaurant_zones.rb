FactoryGirl.define do
  factory :restaurant_zone do
    delivery_date Faker::Date.between(Date.today, Date.new(2017,12,31)) 
    restaurant
    zone
  end
end