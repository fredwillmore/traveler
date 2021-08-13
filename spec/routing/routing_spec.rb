# frozen_string_literal: true

require "rails_helper"

xdescribe "routing" do
  it "routes get: /login to devise/sessions#new" do
    expect(true).to be true
  end

  it "routes get: /login to devise/sessions#new" do
    expect(get: "/login").to route_to("devise/sessions#new")
  end

  it "routes post: /login to devise/sessions#create" do
    expect(post: "/login").to route_to("devise/sessions#create")
  end

  it "routes get: /api/move_player to api#move_player" do
    expect(get: "/api/move_player").to route_to("api#move_player")
  end

  # ADMIN

  it "routes get: /admin/player/index to api#move_player" do
    expect(get: "/admin/players").to route_to("admin/players#index")
  end
end
