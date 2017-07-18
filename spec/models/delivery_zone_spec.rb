require 'rails_helper'

RSpec.describe DeliveryZone, type: :model do
  context "associations" do
    it { should have_many(:restaurants) }
    it { should have_many(:meals) }
  end
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should allow_value("name").for(:name) }
    it { should_not allow_value("").for(:name) }
  end
  
  context "standard factory build" do
    it "is valid and has a name" do
      @zone = build(:delivery_zone)
      expect(@zone).to be_valid
      expect(@zone.name).to_not eql "fdsafsd"
      expect(@zone.name).to eql "Example Zone 1"
    end
  end
end
