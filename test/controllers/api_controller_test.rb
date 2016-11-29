require 'test_helper'

class ApiControllerTest < ActionController::TestCase

  setup do
    @api = GameManager.new
    user = FactoryGirl.create :user
    player = FactoryGirl.create :player
    user.current_player = player
    User.current_user = user
    user

  end

  test "should get current player" do

    assert @api.current_player == player
  end

  test "should move player" do
    new_location = FactoryGirl.create :location
    get :move_player, location: new_location
    assert_response :success
    assert @player.location == new_location
  end

end
