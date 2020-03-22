# frozen_string_literal: true

require "rails_helper"

describe Admin::PlayersController do
  let(:player) { players(:one) }

  it "should get index" do
    get :index
    expect(response.success?).to be true
    # assert_not_nil assigns(:players)
  end

  it "should get new" do
    get :new
    expect(response.success?).to be true
  end

  it "should create player" do
    expect { post :create, player: {  } }.to change(Player, :count)

    # assert_redirected_to player_path(assigns(:player))
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
