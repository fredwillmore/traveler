require 'test_helper'

class Admin::PlayersControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create :user
    @player = FactoryGirl.create :player
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: @player.attributes
    end

    assert_redirected_to admin_player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: @player.attributes
    assert_redirected_to admin_player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to admin_players_path
  end
end
