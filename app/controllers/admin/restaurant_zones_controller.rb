class Admin::RestaurantZonesController < ApplicationController


  def index
  
  end
 
  def create
    
  end


  def by_date
    @date = params[:date]
    @restaurant_zones = RestaurantZone.includes(:restaurant, :zone).where(delivery_date: @date)
    @restaurants = Restaurant.all
    @zones = Zone.all
    
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  
  def destroy
    @restaurant_zone = RestaurantZone.find(params[:id])
    flash[:alert] = "You have deleted restaurant zone #{@restaurant_zone.id} for date #{@restaurant_zone.delivery_date}"
    @restaurant_zone.destroy
    
    @date = params[:date]
    @restaurant_zones = RestaurantZone.includes(:restaurant, :zone).where(delivery_date: @date)
    @restaurants = Restaurant.all
    @zones = Zone.all
    
    respond_to do |format|
      format.js {render "by_date"}
    end
  end

end