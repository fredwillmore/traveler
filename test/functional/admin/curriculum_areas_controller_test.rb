require 'test_helper'

class Admin::CurriculumAreasControllerTest < ActionController::TestCase
  setup do
    @curriculum_area = curriculum_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curriculum_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curriculum_area" do
    assert_difference('CurriculumArea.count') do
      post :create, curriculum_area: @curriculum_area.attributes
    end

    assert_redirected_to admin_curriculum_area_path(assigns(:curriculum_area))
  end

  test "should show curriculum_area" do
    get :show, id: @curriculum_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curriculum_area
    assert_response :success
  end

  test "should update curriculum_area" do
    put :update, id: @curriculum_area, curriculum_area: @curriculum_area.attributes
    assert_redirected_to admin_curriculum_area_path(assigns(:curriculum_area))
  end

  test "should destroy curriculum_area" do
    assert_difference('CurriculumArea.count', -1) do
      delete :destroy, id: @curriculum_area
    end

    assert_redirected_to admin_curriculum_areas_path
  end
end
