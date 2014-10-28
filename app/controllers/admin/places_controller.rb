class Admin::PlacesController < ApplicationController
  # GET /places
  # GET /places.json
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @places }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find_or_create_by(external_id: params[:external_id], player_id: params[:player_id])
    if !@place
      @place = new Place;
    end
    @place.populate_secondary_data

    respond_to do |format|
      format.html # show.html.haml
#      format.json { render json: @place }
      format.json { render :json => @place.to_json(:methods => [:food_cost, :food_value, :drink_cost, :drink_value]) }
    end
  end

  # GET /places/new
  # GET /places/new.json
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to [:admin, @place], notice: 'Place was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        format.html { render action: "new" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.json
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(place_params)
        format.html { redirect_to [:admin, @place], notice: 'Place was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to admin_places_url }
      format.json { head :no_content }
    end
  end

  private
  def place_params
    params.require(:place).permit(
      :name,
      :external_id,
      :player_id,
      :location_id,
      :rating
    )
  end
end
