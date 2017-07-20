FactoryGirl.define do
  factory :meal do
    name {Faker::Food.dish}
    price {Faker::Number.decimal(2)}
    restaurant
  end
end
