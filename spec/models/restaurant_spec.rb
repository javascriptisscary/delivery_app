require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context "associations" do
    it { should have_many(:meals) }
    it { should have_many(:delivery_zones) }
    it { should have_many(:delivery_dates) }
    it { should have_many(:date_restaurant_zones) }
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value("restaurant").for(:name) }
    it { should_not allow_value("").for(:name) }
  end
  
  context "standard factory build" do
    it "is valid and has a name" do
      @restaurant = build(:restaurant)
      expect(@restaurant).to be_valid
      expect(@restaurant.name).to_not eql "fdsafdsa"
    end
  end
end
