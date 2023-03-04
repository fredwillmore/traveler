require 'rails_helper'

module Admin
  describe ChallengeTypesController do
    let(:admin) { create(:user) }
    let!(:challenge_type) { create(:challenge_type, id: 1) }

    before do
      sign_in(admin)
    end

    describe "get index" do
      it "routes to admin/challenge_types#index" do
        expect(get: "/admin/challenge_types").to route_to(controller: "admin/challenge_types", action: "index")
      end

      context "with format=html" do
        it "responds with success" do
          get :index, format: :html
          expect(response).to have_http_status(:success)
        end
      end

      context "with format=json" do
        it "responds with success" do
          get :index, format: :json
          expect(response).to have_http_status(:success)
        end
      end
    end
    
    describe "get new" do
      it "routes to admin/challenge_types#new" do
        expect(get: "/admin/challenge_types/new").to route_to(controller: "admin/challenge_types", action: "new")
      end

      context "with format=html" do
        it "responds with success" do
          get :new, params: { id: 1, format: :html }
          expect(response).to have_http_status(:success)
        end
      end

      context "with format=json" do
        it "responds with success" do
          get :new, params: { id: 1, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "POST /admin/challenge_types" do
      it "routes to admin/challenge_types#create" do
        expect(post: "/admin/challenge_types").to route_to(controller: "admin/challenge_types", action: "create")
      end

      context "with format=html" do
        it "responds with redirect" do
          post :create, params: { challenge_type: { name: 'Thing' }, format: :html }
          expect(response).to have_http_status(:redirect)
        end
      end
      
      context "with format=json" do
        it "responds with success" do
          post :create, params: { challenge_type: { name: 'Thing' }, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "GET /admin/challenge_types/1" do
      it "routes to admin/challenge_types#show" do
        expect(get: "/admin/challenge_types/1").to route_to(controller: "admin/challenge_types", action: "show", id: '1')
      end

      context "with format=html" do
        it "responds with success" do
          get :show, params: { id: 1, format: :html }
          expect(response).to have_http_status(:success)
        end
      end

      context "with format=json" do
        it "responds with success" do
          get :show, params: { id: 1, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end
    
    describe "GET /admin/challenge_types/1/edit" do
      it "routes to admin/challenge_types#edit" do
        expect(get: "/admin/challenge_types/1/edit").to route_to(controller: "admin/challenge_types", action: "edit", id: '1')
      end

      context "with format=html" do
        it "responds with success" do
          get :edit, params: { id: 1, format: :html }
          expect(response).to have_http_status(:success)
        end
      end
    end
    
    describe "PUT /admin/challenge_types/1" do
      it "routes to admin/challenge_types#create" do
        expect(put: "/admin/challenge_types/1").to route_to(controller: "admin/challenge_types", action: "update", id: '1')
      end

      context "with format=html" do
        it "responds with redirect" do
          put :update, params: { id: 1, challenge_type: { name: 'Thing' }, format: :html }
          expect(response).to have_http_status(:redirect)
        end
      end
      
      context "with format=json" do
        it "responds with success" do
          put :update, params: { id: 1, challenge_type: { name: 'Thing' }, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "DELETE /admin/challenge_types/1" do
      it "routes to admin/challenge_types#destroy" do
        expect(delete: "/admin/challenge_types/1").to route_to(controller: "admin/challenge_types", action: "destroy", id: '1')
      end

      context "with format=html" do
        it "responds with redirect" do
          delete :destroy, params: { id: 1, format: :html }
          expect(response).to have_http_status(:redirect)
        end
      end
      
      context "with format=json" do
        it "responds with success" do
          delete :destroy, params: { id: 1, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
