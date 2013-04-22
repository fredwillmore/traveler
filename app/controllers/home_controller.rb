class HomeController < ApplicationController
  def index
    # eventually we'll do some sort of user authentication but for now just stick the id in there
    @player_id=1;
    @player = Player.find @player_id;
    @player_location = Location.find @player.location_id;
  end
end
