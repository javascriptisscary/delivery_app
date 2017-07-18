# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [] # arrays for associations
zones = []

5.times do
 zone = DeliveryZone.create!(
    name: Faker::GameOfThrones.unique.house
  )
 zones.push(zone)
end
  
10.times do
 rest = Restaurant.create!(
    name: Faker::Company.unique.name,
    delivery_zone: zones.sample
  )
 restaurants.push(rest)
end

100.times do
  Meal.create!(
    name: Faker::Food.dish,
    restaurant: restaurants.sample,
    price: Faker::Number.decimal(2),
    delivery_date: Faker::Date.between(Date.today, Date.new(2017,12,31))
  )
end
    