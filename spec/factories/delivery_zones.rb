FactoryGirl.define do
  factory :delivery_zone do
    sequence(:name) { |n| "Example Zone #{n}" }
  end
end
