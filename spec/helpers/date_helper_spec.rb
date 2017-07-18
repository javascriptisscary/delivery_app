require "rails_helper"

describe DateHelper do
  describe "#get_date_from_current_week" do
    it "returns correct date" do
      expect(get_date_from_current_week(Date.today.strftime('%A'))).to eql Date.today
      expect(get_date_from_current_week(Date.tomorrow.strftime('%A'))).to eql Date.tomorrow
    end
  end
end