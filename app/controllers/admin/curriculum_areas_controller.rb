class Admin::CurriculumAreasController < ApplicationController
  # GET /curriculum_areas
  # GET /curriculum_areas.json
  def index
    @curriculum_areas = CurriculumArea.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @curriculum_areas }
    end
  end

  # GET /curriculum_areas/1
  # GET /curriculum_areas/1.json
  def show
    @curriculum_area = CurriculumArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @curriculum_area }
    end
  end

  # GET /curriculum_areas/new
  # GET /curriculum_areas/new.json
  def new
    @curriculum_area = CurriculumArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @curriculum_area }
    end
  end

  # GET /curriculum_areas/1/edit
  def edit
    @curriculum_area = CurriculumArea.find(params[:id])
  end

  # POST /curriculum_areas
  # POST /curriculum_areas.json
  def create
    @curriculum_area = CurriculumArea.new(curriculum_area_params)

    respond_to do |format|
      if @curriculum_area.save
        format.html { redirect_to [:admin, @curriculum_area], notice: 'Curriculum area was successfully created.' }
        format.json { render json: @curriculum_area, status: :created }
      else
        format.html { render action: "new" }
        format.json { render json: @curriculum_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /curriculum_areas/1
  # PUT /curriculum_areas/1.json
  def update
    @curriculum_area = CurriculumArea.find(params[:id])

    respond_to do |format|
      if @curriculum_area.update(curriculum_area_params)
        format.html { redirect_to [:admin, @curriculum_area], notice: 'Curriculum area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @curriculum_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum_areas/1
  # DELETE /curriculum_areas/1.json
  def destroy
    @curriculum_area = CurriculumArea.find(params[:id])
    @curriculum_area.destroy

    respond_to do |format|
      format.html { redirect_to admin_curriculum_areas_url }
      format.json { head :no_content }
    end
  end

  private

  def curriculum_area_params
    params.require(:curriculum_area).permit(
      :title
    )
  end

end
