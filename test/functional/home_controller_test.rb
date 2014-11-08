require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  setup do
    # @user = FactoryGirl.create :user
    # sign_in User.first
  end

  test "should get index" do
    @user = FactoryGirl.create :user
    sign_in User.first
    get :index
    assert_response :success
  end

  test "should redirect unauthenticated user" do
    get :index
    assert_redirected_to :login
  end

end
