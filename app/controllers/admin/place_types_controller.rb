class Admin::PlaceTypesController < ApplicationController
  # GET /place_types
  # GET /place_types.json
  def index
    @place_types = PlaceType.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @place_types }
    end
  end

  # GET /place_types/1
  # GET /place_types/1.json
  def show
    @place_type = PlaceType.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @place_type }
    end
  end

  # GET /place_types/new
  # GET /place_types/new.json
  def new
    @place_type = PlaceType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @place_type }
    end
  end

  # GET /place_types/1/edit
  def edit
    @place_type = PlaceType.find(params[:id])
  end

  # POST /place_types
  # POST /place_types.json
  def create
    @place_type = PlaceType.new(place_type_params)

    respond_to do |format|
      if @place_type.save
        format.html { redirect_to [:admin, @place_type], notice: 'Place type was successfully created.' }
        format.json { render json: @place_type, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @place_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /place_types/1
  # PUT /place_types/1.json
  def update
    @place_type = PlaceType.find(params[:id])

    respond_to do |format|
      if @place_type.update(place_type_params)
        format.html { redirect_to [:admin, @place_type], notice: 'Place type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_types/1
  # DELETE /place_types/1.json
  def destroy
    @place_type = PlaceType.find(params[:id])
    @place_type.destroy

    respond_to do |format|
      format.html { redirect_to admin_place_types_url }
      format.json { head :no_content }
    end
  end

  private
  def place_type_params
    params.require(:place_type).permit(
      :name,
      :label
    )
  end
end
