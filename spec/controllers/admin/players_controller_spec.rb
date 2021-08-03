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

      it "should create player" do
        expect { post :create,  params: params }.to change(Player, :count)

        # assert_redirected_to player_path(assigns(:player))
      end
    end

    # test "should show player" do
    #   get :show, id: @player
    #   assert_response :success
    # end

    # test "should get edit" do
    #   get :edit, id: @player
    #   assert_response :success
    # end

    # test "should update player" do
    #   patch :update, id: @player, player: {  }
    #   assert_redirected_to player_path(assigns(:player))
    # end

    # test "should destroy player" do
    #   assert_difference('Player.count', -1) do
    #     delete :destroy, id: @player
    #   end

    #   assert_redirected_to players_path
    # end



  end
end
