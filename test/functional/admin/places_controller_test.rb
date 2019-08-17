require 'test_helper'

class Admin::PlacesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @place = FactoryBot.create :place
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: @place.attributes
    end

    assert_redirected_to admin_place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    put :update, id: @place, place: @place.attributes
    assert_redirected_to admin_place_path(assigns(:place))
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to admin_places_path
  end
end
