class Admin::RestaurantZonesController < ApplicationController


  def index
  
  end

  def by_date
    date = params[:date]
    @restaurant_zones = RestaurantZone.includes(:restaurant, :zone).where(delivery_date: date)
    respond_to do |format|
      format.js {render layout: false}
    end
  end

end