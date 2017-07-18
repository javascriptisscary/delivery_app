FactoryGirl.define do
  factory :restaurant do
    sequence(:name) { |n| "Restaurant #{n}" }
    delivery_zone
  end
end