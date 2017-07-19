require 'rails_helper'
require 'jwt'

describe 'API::V1::SessionsController' do

  context 'Login' do
    it 'Returns a token' do
      @user = create(:user)
      post "/api/v1/login",  params: {email: @user.email, password:  @user.password }
      
      expect(response).to be_success
      expect(response.content_type).to eq("application/json")
      expect(response_body_as_json['user']['id']).to eql @user.id
    end
  end

end