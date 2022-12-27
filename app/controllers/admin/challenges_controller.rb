class Admin::ChallengesController < ApplicationController

  respond_to :html, :xml, :json
  # GET /challenges
  # GET /challenges.json
  def index
    @challenges = Challenge.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @challenges }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.json
  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/new
  # GET /challenges/new.json
  def new
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
  end

  # POST /challenges
  # POST /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to [:admin, @challenge], notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /challenges/1
  # PUT /challenges/1.json
  def update
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to [:admin, @challenge], notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.json
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to admin_challenges_url }
      format.json { head :no_content }
    end
  end

  def get_by_level
    temp = I18n.locale
    I18n.locale = params[:base_locale]
    challenges = Challenge.find_all_by_level(params[:id])
    @challenge = challenges[rand(challenges.count - 1)]
    I18n.locale = params[:target_locale]
    challenge_id =
    respond_with @challenge
  end

  private
  def challenge_params
    params.require(:challenge).permit(
      # :target_text,
      :challenge_text,
      :curriculum_area_id,
      :level,
      :challenge_type_id
    )
  end
end
