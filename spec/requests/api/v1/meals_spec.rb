require 'rails_helper'

describe "Meals API" do
  it '#SHOW' do
    # {"id"=>1, "name"=>"Lamb Soup", "restaurant"=>{"id"=>2, "name"=>"Example Restaurant",
    # "created_at"=>"2017-07-16T20:54:16.733Z", "updated_at"=>"2017-07-16T20:54:16.733Z"}}
    
    @meal = create(:meal, name: "Lamb Soup", id: 1)

    get '/api/v1/meals/1'
    
    expect(response).to be_success
    expect(response.content_type).to eq("application/json") 
    expect(response_body_as_json['id']).to eql(@meal.id)
    expect(response_body_as_json['name']).to eql(@meal.name)
    expect(response_body_as_json.dig('restaurant','name')).to eql(@meal.restaurant.name)
  end
    
  it '#INDEX' do
    # {"id"=>1, "name"=>"Tom Yum", "restaurant"=>{"id"=>2, "name"=>"Restaurant 2", "delivery_zone_id"=>2, "created_at"=>"2017-07-18T03:06:16.859Z", "updated_at"=>"2017-07-18T03:06:16.859Z"}}
    # {"id"=>2, "name"=>"Chicken", "restaurant"=>{"id"=>3, "name"=>"Restaurant 3", "delivery_zone_id"=>2, "created_at"=>"2017-07-18T03:06:16.861Z", "updated_at"=>"2017-07-18T03:06:16.861Z"}}
    
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
    
end