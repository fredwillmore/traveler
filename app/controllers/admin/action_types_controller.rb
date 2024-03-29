module Admin
  class ActionTypesController < ApplicationController
    # GET /action_types
    # GET /action_types.json
    def index
      @action_types = ActionType.all

      respond_to do |format|
        format.html # index.html.haml
        format.json { render json: @action_types }
      end
    end

    # GET /action_types/1
    # GET /action_types/1.json
    def show
      @action_type = ActionType.find(params[:id])

      respond_to do |format|
        format.html # show.html.haml
        format.json { render json: @action_type }
      end
    end

    # GET /action_types/new
    # GET /action_types/new.json
    def new
      @action_type = ActionType.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @action_type }
      end
    end

    # GET /action_types/1/edit
    def edit
      @action_type = ActionType.find(params[:id])
    end

    # POST /action_types
    # POST /action_types.json
    def create
      @action_type = ActionType.new(action_type_params)
      
      respond_to do |format|
        if @action_type.save
          # format.html { redirect_to @action_type, notice: 'Action type was successfully created.' }
          format.html { 
            redirect_to [:admin, @action_type], notice: 'Action type was successfully created.'
          }
          format.json { 
            render json: @action_type, status: :created
          }
        else
          format.html { render action: "new" }
          format.json { render json: @action_type.errors, status: :unprocessable_entity }
        end
      end
    end

    # PUT /action_types/1
    # PUT /action_types/1.json
    def update
      @action_type = ActionType.find(params[:id])

      respond_to do |format|
        if @action_type.update(action_type_params)
          format.html { redirect_to admin_action_type_path(@action_type), notice: 'Action type was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @action_type.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /action_types/1
    # DELETE /action_types/1.json
    def destroy
      @action_type = ActionType.find(params[:id])
      @action_type.destroy

      respond_to do |format|
        format.html { redirect_to admin_action_types_url }
        format.json { head :no_content }
      end
    end

    private

    def action_type_params
      params.require(:action_type).permit(
        :name
      )
    end
  end
end
