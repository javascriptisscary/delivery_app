class Admin::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.includes(:meals).all
  end

end  