# frozen_string_literal: true

require "rails_helper"

module Admin
  describe PlayersController do
    let(:admin) { create(:user) }
    let(:user) { create(:user) }
    let(:player) { create(:player) }

    before do
      sign_in(admin)
    end

    describe "GET index" do
      it "responds with success" do
        get :index, format: :json
        expect(response.success?).to be true
      end

      it "fetches the players" do
        player
        get :index, format: :json
        expect(response.body).to eq [player].to_json
      end
    end

    describe "GET new" do
      it "responds with success" do
        get :new
        expect(response.success?).to be true
      end
    end

    describe 'POST create' do
      let(:params) { { player: { user_id: user.id } } }

      it "creates a player" do
        expect { post :create, params: params }.to change(Player, :count)
      end

      it "issues a redirect" do
        post :create, params: params
        expect(response).to redirect_to(admin_player_path(controller.instance_variable_get(:@player)))
      end
    end

    describe 'GET show' do
      let(:params) { { id: player.id } }

      it "responds with success" do
        get :show, params: params
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET edit' do
      let(:params) { { id: player.id } }

      it "responds with success" do
        get :edit, params: params
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PATCH update' do
      let(:params) { { id: player.id, player: { name: 'Test Name' } } }

      it "responds with redirect" do
        patch :update, params: params
        expect(response).to have_http_status(:redirect)
      end

      it "updates the player name" do
        expect do
          patch :update, params: params
          player.reload
        end.to change(player, :name).to 'Test Name'
      end
    end

    describe 'DELETE destroy' do
      let(:params) { { id: player.id } }

      before do
        player
      end

      it "responds with redirect" do
        delete :destroy, params: params
        expect(response).to have_http_status(:redirect)
      end

      it "deletes a player record" do
        expect do
          delete :destroy, params: params
        end.to change(Player, :count).by -1
      end
    end
  end
end
