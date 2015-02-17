require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create :user
    @player = FactoryGirl.create :player
    @location = FactoryGirl.create :location
  end

  test "should select player" do
    sign_in @user
    @player.update_attribute(:is_current_player, TRUE)
    @player.update_attribute(:user_id, @user.id)
    @player2 = FactoryGirl.create(:player)
    @player2.update_attribute(:is_current_player, FALSE)
    @player2.update_attribute(:user_id, @user.id)
    get :select_player, player_id: @player2.id
    assert @user.current_player == @player2
  end

  test "should get player location" do
    sign_in @user
    @user.players << @player
    @user.current_player = @player
    get :get_player_location
    loc = instance_variable_get :location
    assert loc == @user.current_player.location
  end

end
