require 'test_helper'

class PlayersControllerTest < ActionController::TestCase

  setup do
    @user = FactoryBot.create :user
    @player = FactoryBot.create :player
    # not sure how to test this just now
    # @player.stubs :avatar_file_name, with: "hello"
    @location = FactoryBot.create :location

    @player.location = @location
    @user.players << @player

    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
    assert_equal assigns(:players), @user.players

    get :index, :format => :json
    assert_response :success
    assert_equal JSON.parse(response.body)[0]['name'], @player.name
    assert_equal JSON.parse(response.body)[0]['location']['lat'], @location.lat.to_s
    # not sure how to test this just now
    # assert_equal JSON.parse(response.body)[0]['avatar_file_name'], "something"
  end

end
