require 'rails_helper'

module Admin
  describe ActionTypesController do
    let(:admin) { create(:user) }
    let(:action_type) { create(:action_type, id: 1) }

    before do
      sign_in(admin)
      action_type
    end

    describe "GET /action_types" do

      context "with format=html" do
        # GET /action_types
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

    describe "GET /action_types/1" do
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

    describe "GET /action_types/new" do
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
    
    describe "GET /action_types/1/edit" do
      context "with format=html" do
        # GET /action_types/1/edit
        it "responds with success" do
          get :edit, params: { id: 1, format: :html }
          expect(response.success?).to be true
        end
      end
    end
    
    describe "POST /action_types" do
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
    
    describe "PUT /action_types/1" do
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
    
    describe "DELETE /action_types/1" do
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
