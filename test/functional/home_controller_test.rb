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

  test "should select player" do
    @user = FactoryGirl.create :user
    sign_in @user
    @player1 = FactoryGirl.create(:player)
    @player1.update_attribute(:is_current_player, TRUE)
    @player1.update_attribute(:user_id, @user.id)
    @player2 = FactoryGirl.create(:player)
    @player2.update_attribute(:is_current_player, FALSE)
    @player2.update_attribute(:user_id, @user.id)
    get :select_player, player_id: @player2.id
    assert @user.current_player == @player2
  end


end
