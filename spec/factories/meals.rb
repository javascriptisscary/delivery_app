FactoryGirl.define do
  factory :meal do
    name Faker::Food.dish
    price Faker::Number.decimal(2)
    delivery_date Faker::Date.between(Date.today, Date.new(2017,12,31))
    restaurant
  end
end
