class Api::V1::MealsController < Api::V1::BaseController
  before_action :require_login, only: [:destroy]
  include DateHelper, MealHelper
  
  def index
    if params[:day] && params[:zone_id]
      date = get_date_from_current_week(params[:day]) # Because we are using dates in db, we must match "day" with date in the current week
      @restaurants = Restaurant.includes(:meals).joins(:restaurant_zones).where(restaurant_zones: {zone_id: params[:zone_id], delivery_date: date})
      @meals = get_meals_from_restaurants(@restaurants)
      
      render json: @meals, each_serializer: Api::V1::MealSerializer
    else
      render json: {status: 400, message: "Can't find meals without zone_id and day"}, status: 400
    end
  end
  
  def show
    if params[:id]
      @meal = Meal.find(params[:id])
      
      render json: @meal, serializer: Api::V1::MealSerializer
    else
      render json: {status: 400, message: "Can't find meal without id"}, status: 400
    end
  end
  
  def destroy # must be logged in via :require_login
    @meal = Meal.find(params[:id])
    @restaurant = @meal.restaurant
    
    if @restaurant.user === current_user # user must own restaurant
      @meal.destroy!
      return render json: {status: 200, message: "Meal #{params[:id]} deleted successfully from restaurant #{@restaurant.name}"}
    else
      render json: {status: 400, message:"You do not own this restaurant and therefore cannot erase this meal"}
    end

  end
  
  private
  
  #we don't trust scary internet
  def meal_params
    params.require(:meal).permit(:day, :id, :zone_id)
  end
  
end
