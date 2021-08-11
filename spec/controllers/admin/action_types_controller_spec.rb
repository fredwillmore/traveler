require 'rails_helper'

module Admin
  describe ActionTypesController do
    let(:admin) { create(:user) }
    let(:action_type) { create(:action_type, id: 1) }

    before do
      sign_in(admin)
      action_type
    end

    describe "GET /admin/action_types" do
      it "routes to admin/action_types#index" do
        expect(get: "/admin/action_types").to route_to(controller: "admin/action_types", action: "index")
      end

      context "with format=html" do
        it "responds with success" do
          get :index, format: :html
          expect(response.success?).to be true
        end
      end

      context "with format=json" do
        # GET /action_types.json
        it "responds with success" do
          get :index, format: :json
          expect(response.success?).to be true
        end
      end
    end

    describe "GET /admin/action_types/1" do
      it "routes to admin/action_types#show" do
        expect(get: "/admin/action_types/1").to route_to(controller: "admin/action_types", action: "show", id: '1')
      end

      context "with format=html" do
        # GET /action_types/1
        it "responds with success" do
          get :show, params: { id: 1, format: :html }
          expect(response.success?).to be true
        end
      end

      context "with format=json" do
        # GET /action_types/1.json
        it "responds with success" do
          get :show, params: { id: 1, format: :json }
          expect(response.success?).to be true
        end
      end
    end

    describe "GET /admin/action_types/new" do
      it "routes to admin/action_types#new" do
        expect(get: "/admin/action_types/new").to route_to(controller: "admin/action_types", action: "new")
      end

      context "with format=html" do
        # GET /action_types/new
        it "responds with success" do
          get :new, params: { id: 1, format: :html }
          expect(response.success?).to be true
        end
      end

      context "with format=json" do
        # GET /action_types/new.json
        it "responds with success" do
          get :new, params: { id: 1, format: :json }
          expect(response.success?).to be true
        end
      end
    end
    
    describe "GET /admin/action_types/1/edit" do
      it "routes to admin/action_types#edit" do
        expect(get: "/admin/action_types/1/edit").to route_to(controller: "admin/action_types", action: "edit", id: '1')
      end

      context "with format=html" do
        # GET /action_types/1/edit
        it "responds with success" do
          get :edit, params: { id: 1, format: :html }
          expect(response.success?).to be true
        end
      end
    end
    
    describe "POST /admin/action_types" do
      it "routes to admin/action_types#create" do
        expect(post: "/admin/action_types").to route_to(controller: "admin/action_types", action: "create")
      end

      context "with format=html" do
        # POST /action_types
        it "responds with success" do
          post :create, params: { action_type: { name: 'Thing' }, format: :html }
          expect(response.redirect?).to be true
        end
      end
      
      context "with format=json" do
        # POST /action_types.json
        it "responds with success" do
          post :create, params: { action_type: { name: 'Thing' }, format: :json }
          expect(response.success?).to be true
        end
      end
    end
    
    describe "PUT /admin/action_types/1" do
      it "routes to admin/action_types#create" do
        expect(put: "/admin/action_types/1").to route_to(controller: "admin/action_types", action: "update", id: '1')
      end

      context "with format=html" do
        # PUT /action_types/1
        it "responds with success" do
          put :update, params: { id: 1, action_type: { name: 'Thing' }, format: :html }
          expect(response.redirect?).to be true
        end
      end
      
      context "with format=json" do
        # PUT /action_types/1.json
        it "responds with success" do
          put :update, params: { id: 1, action_type: { name: 'Thing' }, format: :json }
          expect(response.success?).to be true
        end
      end
    end
    
    describe "DELETE /admin/action_types/1" do
      it "routes to admin/action_types#destroy" do
        expect(delete: "/admin/action_types/1").to route_to(controller: "admin/action_types", action: "destroy", id: '1')
      end

      context "with format=html" do
        # DELETE /action_types/1
        it "responds with success" do
          delete :destroy, params: { id: 1, format: :html }
          expect(response.redirect?).to be true
        end
      end
      
      context "with format=json" do
        # DELETE /action_types/1.json
        it "responds with success" do
          delete :destroy, params: { id: 1, format: :json }
          expect(response.success?).to be true
        end
      end
    end
  end
end
