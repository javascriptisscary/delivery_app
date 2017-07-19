FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    token "token"
    email {Faker::Internet.unique.email}
    password "password"
  end
end
