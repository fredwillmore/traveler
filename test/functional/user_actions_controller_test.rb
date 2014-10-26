require 'test_helper'

class UserActionsControllerTest < ActionController::TestCase
  setup do
    @user_action = user_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action" do
    assert_difference('UserAction.count') do
      post(:create, {user_action: @user_action.attributes})
    end

    assert_redirected_to user_action_path(assigns(:user_action))
  end

  test "should show action" do
    get :show, id: @user_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_action
    assert_response :success
  end

  test "should update action" do
    post(:update, {id: @user_action}, {user_action: @user_action.attributes})
    assert_redirected_to user_action_path(assigns(:user_action))
  end

  test "should destroy action" do
    assert_difference('UserAction.count', -1) do
      delete :destroy, id: @user_action
    end

    assert_redirected_to user_actions_path
  end
end
