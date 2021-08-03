module Admin
  class PlayersController < ApplicationController

    respond_to :html, :xml, :json
    # GET /players
    # GET /players.json
    def index
      @players = Player.all

      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @players }
      end
    end

    # GET /players/1
    # GET /players/1.json
    def show
      @player = Player.find(params[:id])

      respond_to do |format|
        format.html # show.html.haml
        format.json { render json: @player }
      end
    end

    # GET /players/new
    # GET /players/new.json
    def new
      @player = Player.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @player }
      end
    end

    # GET /players/1/edit
    def edit
      @player = Player.find(params[:id])
    end

    # POST /players
    # POST /players.json
    def create
      @player = Player.new(player_params)
      @player.save

      respond_to do |format|
        if @player.save
          format.html { redirect_to [:admin, @player], notice: 'Player was successfully created.' }
          format.json { render json: @player, status: :created, location: @player }
        else
          format.html { render action: "new" }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /players/1
    # PUT /players/1.json
    def update
      @player = Player.find(params[:id])

      respond_to do |format|
        if @player.update_attributes(player_params)
          format.html { redirect_to [:admin, @player], notice: 'Player was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @player.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /players/1
    # DELETE /players/1.json
    def destroy
      @player = Player.find(params[:id])
      @player.destroy

      respond_to do |format|
        format.html { redirect_to admin_players_url }
        format.json { head :no_content }
      end
    end

    def start_travel
      @player = Player.find(params[:id])
      @player.start_travel
      respond_with @player
    end

    def finish_travel
      @player = Player.find(params[:id])
      @player.finish_travel
      respond_with @player
    end

    private

    def player_params
      params.require(:player).permit(
          :user_id,
          :state,
          :location_id,
          :level,
          :sex,
          :dob,
          :occupation,
          :attractiveness,
          :charisma,
          :status,
          :intelligence,
          :luck,
          :base_locale,
          :target_locale,
          :target_dialect
      )
    end
  end
end
