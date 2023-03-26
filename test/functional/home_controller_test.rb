require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  setup do
    @user = FactoryBot.create :user
    @player = FactoryBot.create :player
    @location = FactoryBot.create :location
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
  end

  test "should redirect unauthenticated user" do
    get :index
    assert_redirected_to :login
  end

end
