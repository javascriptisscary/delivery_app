# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = [] # arrays for associations
users =[]
zones = []

5.times do
 zone = Zone.create!(
   name: Faker::GameOfThrones.unique.house
  )
 zones.push(zone)
end
  
10.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.free_email,
    password: "password"
  )
  users.push(user)
end
  
10.times do |i|
 rest = Restaurant.create!(
   name: Faker::Company.unique.name,
   user: users[i]
  )
 restaurants.push(rest)
end

50.times do
  Meal.create!(
    name: Faker::Food.dish,
    restaurant: restaurants.sample,
    price: Faker::Number.decimal(2),
  )
end

Date.today.upto(Date.new(2017,12,31)).each do |date|
  10.times do |i| # create mulitple zones to semi-realistically accommodate multiple restaurants in the join table
    RestaurantZone.create(
      zone: zones.sample,
      restaurant: restaurants.sample, # to do, restaurant cannot have more than one zone per day
      delivery_date: date
    )
  end
end
    