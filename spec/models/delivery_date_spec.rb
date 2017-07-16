require 'rails_helper'

RSpec.describe DeliveryDate, type: :model do
  context "associations" do
    it { should have_many(:restaurants) }
    it { should have_many(:delivery_zones) }
    it { should have_many(:date_restaurant_zones) }
  end
  
  context "validations" do
    it { should allow_value(Date.new(2017,10,11)).for(:delivery_date) }
    it { should_not allow_value("").for(:delivery_date) }
    it { should_not allow_value("dog").for(:delivery_date) }
    it { should_not allow_value(Date.new(2017,6,10)).for(:delivery_date) } #should not allow a past date
  end
  
  context "standard factory build" do
    it "is valid and has a name and associations" do
      @date = build(:delivery_date)
      expect(@date).to be_valid
      expect(@date.delivery_date).to_not eql Date.new(2017,10,05)
      expect(@date.delivery_date).to eql Date.new(2017,10,10)
    end
  end
end
