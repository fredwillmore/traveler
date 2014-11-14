class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user
      @player = Player.new level: 1
      @player_location = @player.location
    else
      redirect_to login
    end
  end

  def select_player
    Player.find(current_user.current_player.id).update_attribute :is_current_player, FALSE
    Player.find(params[:player_id]).update_attribute :is_current_player, TRUE
    respond_to do |format|
      format.html
      format.js
    end
    # current_user.players.find(params[:player_id]).update_attribute :is_current_player, TRUE
  end

  def get_place

  end

end
