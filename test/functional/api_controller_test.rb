require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  setup do
    @user = FactoryBot.create :user
    @player = FactoryBot.create :player
    @player.update(user_id: @user.id, is_current_player: TRUE)
    @player2 = FactoryBot.create(:player)
    @player2.update(user_id: @user.id, is_current_player: FALSE)
    @location = FactoryBot.create :location
    @location2 = FactoryBot.create :location, lat: 101, lng: 88
    sign_in @user
  end

  def test_select_player
    get :select_player, player_id: @player2.id
    assert @user.current_player == @player2
  end

  def test_get_player_location
    @player.location = @location
    @user.players << @player
    @user.current_player = @player
    get :get_player_location
    assert assigns(:location) == @user.current_player.location
    assert JSON.parse(response.body)['id'] == @location.id
  end

  def test_update_player_destination
    put :update_player_destination, location_id: @location2.id, player_id: @user.current_player.id
    assert JSON.parse(response.body)['id'] == @location2.id
  end

  def test_add_location
    post :add_location, external_id: "ChIJhRmdbbxGmRIRiPpXk_IayrY" # IBIZA!
  end

  teardown do
    @user.destroy
  end
end
