require 'rails_helper'

module Admin
  describe DashboardController do
    let(:admin) { create(:user) }

    describe "get index" do
      it "routes to #index" do
        expect(get: 'admin/').to route_to(controller: 'admin/dashboard', action: "index")
      end
  
      it "responds with success" do
        get :index, format: :html
        expect(response).to have_http_status(:success)
      end
    end
  end
end
