class ApiController < ApplicationController
  before_filter :authenticate_user!

  def select_player
    Player.find(current_user.current_player.id).update_attribute :is_current_player, FALSE
    Player.find(params[:player_id]).update_attribute :is_current_player, TRUE
    respond_to do |format|
      format.html
      format.js
    end
    # current_user.players.find(params[:player_id]).update_attribute :is_current_player, TRUE
  end

  def check_player_name
  end

  def select_player
  end

  def update_player_destination
  end

  def get_player_location
  end
end
