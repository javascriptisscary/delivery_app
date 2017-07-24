class Admin::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.includes(:meals).all
  end
  
  def show
    @restaurant = Restaurant.includes(:meals).find(params[:id])
    
    respond_to do |format|
      format.js {render "with_meals"}
    end
  end
  
  private
  
  def restaurant_params
    params.require(:restaurant).permit(:meal_id, :name, :user_id)
  end

end  