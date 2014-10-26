class HomeController < ApplicationController
  def index
    # eventually we'll do some sort of user authentication but for now just stick the id in there
    #  @user = User.find 1 # don't know why user isnt sticking in seed
    # @player = Player.find 1
    @player = Player.new
    @player_location = Location.find @player.location_id
#    I18n.locale = @player.base_locale
    noop =0;
  end
end
