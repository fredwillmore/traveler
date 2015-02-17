require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create :user
    @place = FactoryGirl.create :place
    sign_in User.first
  end

  test "should show place" do
    get :show, external_id: @place.external_id
    assert_response :success
  end
end
