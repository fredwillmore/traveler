require 'test_helper'

class Admin::ChallengeTypesControllerTest < ActionController::TestCase
  setup do
    @challenge_type = challenge_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenge_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge_type" do
    assert_difference('ChallengeType.count') do
      post :create, challenge_type: @challenge_type.attributes
    end

    assert_redirected_to admin_challenge_type_path(assigns(:challenge_type))
  end

  test "should show challenge_type" do
    get :show, id: @challenge_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge_type
    assert_response :success
  end

  test "should update challenge_type" do
    put :update, id: @challenge_type, challenge_type: @challenge_type.attributes
    assert_redirected_to admin_challenge_type_path(assigns(:challenge_type))
  end

  test "should destroy challenge_type" do
    assert_difference('ChallengeType.count', -1) do
      delete :destroy, id: @challenge_type
    end

    assert_redirected_to admin_challenge_types_path
  end
end
