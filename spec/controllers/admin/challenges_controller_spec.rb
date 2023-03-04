require 'rails_helper'

module Admin
  describe ChallengesController do
    let(:admin) { create(:user) }
    let!(:challenge) { create(:challenge, id: 1) }

    before do
      sign_in(admin)
    end

    describe "get index" do
      it "routes to admin/challenges#index" do
        expect(get: "/admin/challenges").to route_to(controller: "admin/challenges", action: "index")
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
      it "routes to admin/challenges#new" do
        expect(get: "/admin/challenges/new").to route_to(controller: "admin/challenges", action: "new")
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

    describe "POST /admin/challenges" do
      it "routes to admin/challenges#create" do
        expect(post: "/admin/challenges").to route_to(controller: "admin/challenges", action: "create")
      end

      context "with format=html" do
        it "responds with redirect" do
          post :create, params: { challenge: { name: 'Thing' }, format: :html }
          expect(response).to have_http_status(:redirect)
        end
      end
      
      context "with format=json" do
        it "responds with success" do
          post :create, params: { challenge: { name: 'Thing' }, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "GET /admin/challenges/1" do
      it "routes to admin/challenges#show" do
        expect(get: "/admin/challenges/1").to route_to(controller: "admin/challenges", action: "show", id: '1')
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
    
    describe "GET /admin/challenges/1/edit" do
      it "routes to admin/challenges#edit" do
        expect(get: "/admin/challenges/1/edit").to route_to(controller: "admin/challenges", action: "edit", id: '1')
      end

      context "with format=html" do
        it "responds with success" do
          get :edit, params: { id: 1, format: :html }
          expect(response).to have_http_status(:success)
        end
      end
    end
    
    describe "PUT /admin/challenges/1" do
      it "routes to admin/challenges#create" do
        expect(put: "/admin/challenges/1").to route_to(controller: "admin/challenges", action: "update", id: '1')
      end

      context "with format=html" do
        it "responds with redirect" do
          put :update, params: { id: 1, challenge: { name: 'Thing' }, format: :html }
          expect(response).to have_http_status(:redirect)
        end
      end
      
      context "with format=json" do
        it "responds with success" do
          put :update, params: { id: 1, challenge: { name: 'Thing' }, format: :json }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe "DELETE /admin/challenges/1" do
      it "routes to admin/challenges#destroy" do
        expect(delete: "/admin/challenges/1").to route_to(controller: "admin/challenges", action: "destroy", id: '1')
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
