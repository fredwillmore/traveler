class Admin::UserActionsController < ApplicationController
  # GET /user_actions
  # GET /user_actions.json
  def index
    @user_actions = UserAction.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @user_actions }
    end
  end

  # GET /user_actions/1
  # GET /user_actions/1.json
  def show
    @user_action = UserAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @user_action }
    end
  end

  # GET /user_actions/new
  # GET /user_actions/new.json
  def new
    @user_action = UserAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_action }
    end
  end

  # GET /user_actions/1/edit
  def edit
    @user_action = UserAction.find(params[:id])
  end

  # POST /user_actions
  # POST /user_actions.json
  def create
    @user_action = UserAction.new(user_action_params)

    respond_to do |format|
      if @user_action.save
        format.html { redirect_to [:admin, @user_action], notice: 'Action was successfully created.' }
        format.json { render json: @user_action, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @user_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_actions/1
  # PUT /user_actions/1.json
  def update
    @user_action = UserAction.find(params[:id])

    respond_to do |format|
      if @user_action.update(user_action_params)
        format.html { redirect_to [:admin, @user_action], notice: 'Action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_actions/1
  # DELETE /user_actions/1.json
  def destroy
    @user_action = UserAction.find(params[:id])
    @user_action.destroy

    respond_to do |format|
      format.html { redirect_to admin_user_actions_url }
      format.json { head :no_content }
    end
  end

  private

  def user_action_params
    params.require(:user_action).permit(
      :action_type_id,
      :reward_id,
      :risk_id,
      :challenge_id
    )
  end
end
