require "rails_helper"

xdescribe Admin::PlayersController do
  let(:player) { players(:one) }

  it "should get index" do
    get :index
    expect(response.success?).to be true
    # assert_not_nil assigns(:players)
  end

  it "should get new" do
    get :new
    # assert_response :success
    expect(response.success?).to be true
  end

  it "should create player" do
    expect do
      post :create, player: {  }
    end.to change(Player, :count)
  end
  
  it "redirects to player path" do
    assert_redirected_to player_path(assigns(:player))
  end

  it "should show player" do
    get :show, id: @player
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  it "should update player" do
    patch :update, id: @player, player: {  }
    assert_redirected_to player_path(assigns(:player))
  end

  # test "should destroy player" do
  #   assert_difference('Player.count', -1) do
  #     delete :destroy, id: @player
  #   end

  #   assert_redirected_to players_path
  # end



end
