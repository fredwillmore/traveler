require 'test_helper'

class Admin::ActionTypesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create :user
    @action_type = FactoryGirl.create :action_type
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_type" do
    assert_difference('ActionType.count') do
      post :create, action_type: @action_type.attributes
    end

    assert_redirected_to admin_action_type_path(assigns(:action_type))
  end

  test "should show action_type" do
    get :show, id: @action_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @action_type
    assert_response :success
  end

  test "should update action_type" do
    put :update, id: @action_type, action_type: @action_type.attributes
    assert_redirected_to admin_action_type_path(assigns(:action_type))
  end

  test "should destroy action_type" do
    assert_difference('ActionType.count', -1) do
      delete :destroy, id: @action_type
    end

    assert_redirected_to admin_action_types_path
  end
end
