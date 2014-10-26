class ChallengeTypesController < ApplicationController
  # GET /challenge_types
  # GET /challenge_types.json
  def index
    @challenge_types = ChallengeType.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @challenge_types }
    end
  end

  # GET /challenge_types/1
  # GET /challenge_types/1.json
  def show
    @challenge_type = ChallengeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @challenge_type }
    end
  end

  # GET /challenge_types/new
  # GET /challenge_types/new.json
  def new
    @challenge_type = ChallengeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenge_type }
    end
  end

  # GET /challenge_types/1/edit
  def edit
    @challenge_type = ChallengeType.find(params[:id])
  end

  # POST /challenge_types
  # POST /challenge_types.json
  def create
    @challenge_type = ChallengeType.new(params[:challenge_type])

    respond_to do |format|
      if @challenge_type.save
        format.html { redirect_to @challenge_type, notice: 'Challenge type was successfully created.' }
        format.json { render json: @challenge_type, status: :created, location: @challenge_type }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /challenge_types/1
  # PUT /challenge_types/1.json
  def update
    @challenge_type = ChallengeType.find(params[:id])

    respond_to do |format|
      if @challenge_type.update_attributes(params[:challenge_type])
        format.html { redirect_to @challenge_type, notice: 'Challenge type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenge_types/1
  # DELETE /challenge_types/1.json
  def destroy
    @challenge_type = ChallengeType.find(params[:id])
    @challenge_type.destroy

    respond_to do |format|
      format.html { redirect_to challenge_types_url }
      format.json { head :no_content }
    end
  end
end
