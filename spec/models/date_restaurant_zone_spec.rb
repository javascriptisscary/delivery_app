require 'rails_helper'

RSpec.describe DateRestaurantZone, type: :model do
  context "associations" do
    it { should belong_to(:restaurant) }
    it { should belong_to(:delivery_zone) }
  end
end