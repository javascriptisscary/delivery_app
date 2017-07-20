FactoryGirl.define do
  factory :zone do
    sequence(:name) { |n| "Example Zone #{n}" }
  end
end
