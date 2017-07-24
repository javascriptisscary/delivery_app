require 'rails_helper'

RSpec.describe RestaurantZone, type: :model do
  context "associations" do
    it { should belong_to(:restaurant) }
    it { should belong_to(:zone) }
  end
  
  #validations
  context "validations" do
    it "will not validate a restaurant with more than one zone per date" do
      @restaurant = create(:restaurant)
      @zone = create(:zone)
      @restaurant_zone = create(:restaurant_zone, delivery_date: Date.tomorrow, restaurant: @restaurant, zone: @zone )
      expect(create(:restaurant_zone, delivery_date: Date.tomorrow, restaurant: @restaurant)).to raise_error(
                                      ActiveRecord::RecordInvalid,'Validation failed: Restaurant can only have one zone per date') #TODO test is failing even though it's returning exactly what it should
      
    end
  end
  
end