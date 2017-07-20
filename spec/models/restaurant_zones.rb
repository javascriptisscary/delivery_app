require 'rails_helper'

RSpec.describe RestaurantZone, type: :model do
  context "associations" do
    it { should belong_to(:restaurant) }
    it { should belong_to(:zone) }
  end
  
  
end