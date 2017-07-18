require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  context "associations" do
    it { should have_many(:meals) }
    it { should belong_to(:delivery_zone) }
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value("restaurant").for(:name) }
    it { should_not allow_value("").for(:name) }
  end
  
  context "standard factory build" do
    it "is valid and has a name" do
      @restaurant = create(:restaurant)
      expect(@restaurant).to be_valid
      expect(@restaurant.name).to_not eql "fdsafdsa"
    end
  end
  
  context "is destroyed" do
    it "destroys dependent meals" do
      @restaurant = create(:restaurant)
      @meal = create(:meal, restaurant: @restaurant)
      expect { @restaurant.destroy }.to change { Meal.count }.by(-1)
    end
  end
end
