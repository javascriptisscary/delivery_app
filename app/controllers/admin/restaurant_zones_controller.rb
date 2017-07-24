class Admin::RestaurantZonesController < ApplicationController
  before_action :require_admin

  def index
  
  end
 
  def create
    @restaurant_zone = RestaurantZone.new(restaurant_zone_params)
    if @restaurant_zone.save
      flash[:notice] = "New restaurant zone created with a restaurant #{@restaurant_zone.restaurant.name},
                      zone #{@restaurant_zone.zone.name}, and date of #{@restaurant_zone.delivery_date}" 
    else
      flash[:alert] = @restaurant_zone.errors.full_messages.to_sentence
    end
    get_restaurant_zones_for_partial(@restaurant_zone.delivery_date)
    respond_to do |format|
        format.js {render "by_date"}
    end
  end


  def by_date
    @date = params[:delivery_date]
    
    get_restaurant_zones_for_partial(@date)
    respond_to do |format|
      format.js {render layout: false}
    end
  end
  
  def destroy
    @restaurant_zone = RestaurantZone.find(params[:id])
    @date = @restaurant_zone.delivery_date
    flash[:alert] = "You have deleted restaurant zone #{@restaurant_zone.id} for date #{@restaurant_zone.delivery_date}"
    @restaurant_zone.destroy
    
    get_restaurant_zones_for_partial(@date)
    respond_to do |format|
      format.js {render "by_date"}
    end
  end
  
  private
  
  def get_restaurant_zones_for_partial(date)
    @restaurant_zones = RestaurantZone.includes(:restaurant, :zone).where(delivery_date: date).order(:zone_id)
  end
  
  def restaurant_zone_params
    params.require(:restaurant_zone).permit(:delivery_date, :restaurant_id, :zone_id)
  end

end