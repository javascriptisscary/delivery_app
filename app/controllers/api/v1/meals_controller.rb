class Api::V1::MealsController < ActionController::API
  include DateHelper
 
  def index
    if params[:day] && params[:zone_id]
      @date = get_date_from_current_week(params[:day]) # Because we are using dates in db, we must match "day" with date in the current week
      @zone = DeliveryZone.find(params[:zone_id]) # get zone
      @meals = @zone.meals.where(delivery_date: @date) #get meals from zone with supplied day(date)
      
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
  
  private
  
  #we don't trust scary internet
  def meal_params
    params.require(:meal).permit(:day, :id, :zone_id)
  end
  
end
