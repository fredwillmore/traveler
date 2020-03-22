class ApiController < ApplicationController
  # before_action :authenticate_user!

  def login
    puts 'we are here'
    debugger
  end

  def check_player_name
  end

  def move_player
    current_player.update!(
      location: Location.find(params[:location])
    )
    
    head "200"
    # respond_to do |format|
      # format.html do
      #   current_player.location = params[:destination]
      # end
      # format.json do
      #   current_player.location = params[:destination]
      # end
    # end
  end

  def current_player
    current_user.current_player
  end

  def select_player
    if current_user.players.map(&:id).include? params[:player_id].to_i
      current_user.players.each do |player|
        player.update_attribute :is_current_player, player.id == params[:player_id].to_i
      end
    end
  end

  def update_player_destination
    if (current_user.current_player.id == params[:player_id].to_i) && (location = Location.find params[:location_id])
      # TODO: why doesn't this work?
      # current_user.current_player.destination = location
      current_user.current_player.update_attribute :destination_id, location.id
    end
    render json: current_user.current_player.destination
  end

  def get_player_location
    @location = current_user.current_player.location
    render json: @location
  end

  def add_location
    @client = GooglePlaces::Client.new(Place::API_KEY)
  end
end
