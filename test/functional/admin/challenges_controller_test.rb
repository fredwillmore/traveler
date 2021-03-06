require 'test_helper'

class Admin::ChallengesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @challenge = FactoryBot.create :challenge
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge" do
    # TODO: fix this later
    # assert_difference('Challenge.count') do
      # post :create, challenge: @challenge.attributes
    # end

    #assert_redirected_to admin_challenge_path(assigns(:challenge))
  end

  test "should show challenge" do
    get :show, id: @challenge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenge
    assert_response :success
  end

  test "should update challenge" do
    put :update, id: @challenge, challenge: @challenge.attributes
    assert_redirected_to admin_challenge_path(assigns(:challenge))
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete :destroy, id: @challenge
    end

    assert_redirected_to admin_challenges_path
  end
end
