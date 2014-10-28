require 'test_helper'

class Admin::PlaceTypesControllerTest < ActionController::TestCase
  setup do
    @place_type = place_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:place_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place_type" do
    assert_difference('PlaceType.count') do
      post :create, place_type: @place_type.attributes
    end
    assert_redirected_to admin_place_type_path(assigns(:place_type))
  end

  test "should show place_type" do
    get :show, id: @place_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place_type
    assert_response :success
  end

  test "should update place_type" do
    put :update, id: @place_type, place_type: @place_type.attributes
    assert_redirected_to admin_place_type_path(assigns(:place_type))
  end

  test "should destroy place_type" do
    assert_difference('PlaceType.count', -1) do
      delete :destroy, id: @place_type
    end

    assert_redirected_to admin_place_types_path
  end
end
