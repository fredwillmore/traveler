require 'test_helper'

class Admin::RewardTypesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @reward_type = FactoryBot.create :reward_type
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reward_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reward_type" do
    assert_difference('RewardType.count') do
      post :create, reward_type: @reward_type.attributes
    end

    assert_redirected_to admin_reward_type_path(assigns(:reward_type))
  end

  test "should show reward_type" do
    get :show, id: @reward_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reward_type
    assert_response :success
  end

  test "should update reward_type" do
    put :update, id: @reward_type, reward_type: @reward_type.attributes
    assert_redirected_to admin_reward_type_path(assigns(:reward_type))
  end

  test "should destroy reward_type" do
    assert_difference('RewardType.count', -1) do
      delete :destroy, id: @reward_type
    end

    assert_redirected_to admin_reward_types_path
  end
end
