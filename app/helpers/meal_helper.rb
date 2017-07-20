module MealHelper
  def get_meals_from_restaurants(restaurants)
    meals_array = []
    @restaurants.each do |r|
      r.meals.each do |meal|
        meals_array.push(meal)
      end
    end
    meals_array
  end
end