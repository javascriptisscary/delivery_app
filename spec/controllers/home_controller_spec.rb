require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  context "No user is logged in" do
  
    describe "GET #index" do
      it 'renders :index template' do
        expect(get: root_url(subdomain: nil)).to route_to(controller: "home", action: "index")
        expect(response).to have_http_status(:ok)
      end
    end
  end

end