class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      @player = Player.new level: 1
      @player_location = @player.location
    else
      redirect_to login
    end
  end

end
