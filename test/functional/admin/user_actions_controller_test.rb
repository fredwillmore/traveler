require 'test_helper'

class Admin::UserActionsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @user_action = FactoryBot.create :user_action
    sign_in User.first
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

    assert_redirected_to admin_user_action_path(assigns(:user_action))
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
    post(:update, id: @user_action, user_action: @user_action.attributes)
    assert_redirected_to admin_user_action_path(assigns(:user_action))
  end

  test "should destroy action" do
    assert_difference('UserAction.count', -1) do
      delete :destroy, id: @user_action
    end

    assert_redirected_to admin_user_actions_path
  end
end
