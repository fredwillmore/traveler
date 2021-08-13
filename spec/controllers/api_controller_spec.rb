# frozen_string_literal: true

require "rails_helper"

describe ApiController do

  let(:api) { GameManager.new }
  let(:user) { create :user, players: [player] }
  let(:player) { create :player, is_current_player: true }
  let(:new_location) { create :location }

  before do
    user.current_player = player
    sign_in user
  end

  it "should get current player" do
    expect(controller.current_player).to eq player
  end

  it "should move player" do
    get :move_player, params: { location: new_location }
    player.reload
    expect(response).to have_http_status(:success)
    expect(player.location).to eq new_location
  end

end
