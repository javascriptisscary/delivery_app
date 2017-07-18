class Api::V1::MealsController < ActionController::API
  include DateHelper
 
  def index
    @date = get_date_from_current_week(params[:day]) # Because we are using dates in db, we must match "day" with date in the current week
    @zone = DeliveryZone.find(params[:zone_id])
    @meals = @zone.meals.where(delivery_date: @date)
     
    render json: @meals, each_serializer: Api::V1::MealSerializer
  end
  
  def show
    @meal = Meal.find(params[:id])
    render json: @meal, serializer: Api::V1::MealSerializer
  end
  
  private
  
  #we don't trust scary internet
  def meal_params
    params.require(:meal).permit(:day, :id, :zone_id)
  end
  
end
