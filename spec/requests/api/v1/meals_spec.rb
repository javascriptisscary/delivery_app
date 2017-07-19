require 'rails_helper'
require 'jwt'

describe "Meals API" do
  context '#SHOW' do
    # {"id"=>1, "name"=>"Lamb Soup", "restaurant"=>{"id"=>2, "name"=>"Example Restaurant",
    # "created_at"=>"2017-07-16T20:54:16.733Z", "updated_at"=>"2017-07-16T20:54:16.733Z"}}
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
    # {"id"=>1, "name"=>"Tom Yum", "restaurant"=>{"id"=>2, "name"=>"Restaurant 2", "delivery_zone_id"=>2, "created_at"=>"2017-07-18T03:06:16.859Z", "updated_at"=>"2017-07-18T03:06:16.859Z"}}
    # {"id"=>2, "name"=>"Chicken", "restaurant"=>{"id"=>3, "name"=>"Restaurant 3", "delivery_zone_id"=>2, "created_at"=>"2017-07-18T03:06:16.861Z", "updated_at"=>"2017-07-18T03:06:16.861Z"}}
    
    it "returns correct json with meals" do
      @zone = create(:delivery_zone)
      @rest = create(:restaurant, delivery_zone: @zone)
      @rest2 = create(:restaurant, delivery_zone: @zone)
      @meal = create(:meal, name: "Tom Yum", restaurant: @rest, delivery_date: Date.today)
      @meal2 = create(:meal, name: "Chicken", restaurant: @rest2, delivery_date: Date.today)
      
      get "/api/v1/meals/?zone_id=#{@zone.id}&day=#{Date.today.strftime('%A')}"
      
      expect(response).to be_success
      expect(response.content_type).to eq("application/json") 
      expect(response_body_as_json.length).to eql(2)
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
      response.set_header('Content-Type', 'application/vnd.api+json; charset=utf-8')
      #@request.env['Authorization'] = response_body_as_json['token']
      delete '/api/v1/meals/1'
      puts response_body_as_json
      # todo
    end
  end
    
  
  
  
  
    
end