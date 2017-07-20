FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    user
  end
end