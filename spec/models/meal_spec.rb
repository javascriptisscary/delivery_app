require 'rails_helper'

RSpec.describe Meal, type: :model do
  context "associations" do
    it { should belong_to(:restaurant) }
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value("restaurant").for(:name) }
    it { should_not allow_value("").for(:name) }
  end
  
  context "standard factory build" do
    it "is valid" do
      @zone = create(:delivery_zone)
      @rest = create(:restaurant, delivery_zone: @zone)
      @meal = create(:meal, restaurant: @rest)
      expect(@meal).to be_valid
      expect(@meal.name).to_not eql "fdsafdsa"
      expect(@meal.restaurant.name).to eql @rest.name
    end
  end
end
