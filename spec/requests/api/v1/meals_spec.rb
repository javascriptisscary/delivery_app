require 'rails_helper'
require 'jwt'

describe "Meals API" do
  context '#SHOW' do
    it "returns correct json meal" do
      @meal = create(:meal, name: "Lamb Soup", id: 1)
      get '/api/v1/meals/1'
      
      expect(response).to be_success
      expect(response.content_type).to eq("application/json") 
      expect(response_body_as_json['id']).to eql(@meal.id)
      expect(response_body_as_json['name']).to eql(@meal.name)
      expect(response_body_as_json.dig('restaurant','name')).to eql(@meal.restaurant.name)
    end
  end
    
  context '#INDEX' do
    it "returns correct meals by date and zone" do
      @zone = create(:zone)
      @rest = create(:restaurant)
      @rest2 = create(:restaurant)
      create(:restaurant_zone, restaurant: @rest, zone:@zone, delivery_date: Date.today)
      create(:restaurant_zone, restaurant: @rest2, zone:@zone, delivery_date: Date.today)
      create(:restaurant_zone, restaurant: @rest2, zone:@zone, delivery_date: Date.tomorrow)
      @meal = create(:meal, name: "Tom Yum", restaurant: @rest)
      @meal2 = create(:meal, name: "Chicken", restaurant: @rest2)
      
      get "/api/v1/meals/?zone_id=#{@zone.id}&day=#{Date.today.strftime('%A')}"
      
      expect(response.content_type).to eq("application/json") 
      expect(response_body_as_json.length).to eql(2) #only returns 2 meals, as the 3rd meal is on a different day
      expect(response_body_as_json[0].dig('name')).to eql(@meal.name)
      expect(response_body_as_json[1].dig('name')).to eql(@meal2.name)
    end
    
    it "returns a 400 error and message" do
      get "/api/v1/meals/?day=#{Date.today.strftime('%A')}"
      
      expect(response).to be_bad_request
      expect(response.content_type).to eq("application/json")
      expect(response_body_as_json['message']).to eq("Can't find meals without zone_id and day")
    end
    
  end
  
  context '#DESTROY' do
    it "logins and deletes a meal from a user owned restaurant" do
      @user = create(:user)
      @restaurant = create(:restaurant, user: @user)
      @meal = create(:meal, restaurant: @restaurant)
      
      post "/api/v1/login",  params: {email: @user.email, password:  @user.password }
      #set_header('Content-Type', 'application/vnd.api+json; charset=utf-8')
      #@request.env['Authorization'] = response_body_as_json['token']
      delete '/api/v1/meals/1'
      pending("destroy meal test")
      raise "pending"
      # todo
    end
  end
    
  
  
  
  
    
end