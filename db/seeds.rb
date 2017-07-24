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
   name: Faker::LordOfTheRings.unique.location
  )
 zones.push(zone)
end
  
10.times do
  first_name = Faker::Name.unique.first_name
  user = User.create!(
    name: first_name,
    email: Faker::Internet.free_email(first_name),
    password: "password",
  )
  users.push(user)
end
  
10.times do |i|
 rest = Restaurant.create!(
   name: "Restaurant #{i+1}",
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
  list = []
  list += restaurants # need a new object_id, not just a reference to the same object restaurants
  8.times do |i| # create mulitple zones to semi-realistically accommodate multiple restaurants in the join table
    RestaurantZone.create(
      zone: zones.sample,
      restaurant: list.delete_at(rand(list.length)), # each time through the day, pick one restaurant at random, pop item, then reset at start of new day. This prevents 1 restaurant from having multiple zones per day
      delivery_date: date
    )
  end
end
    
# admin     
User.create!(
  name: "Admin",
  email: "admin@example.com",
  password: "password",
  is_admin: 1
)    