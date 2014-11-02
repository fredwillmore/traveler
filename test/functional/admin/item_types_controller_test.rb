require 'test_helper'

class Admin::ItemTypesControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create :user
    @item_type = FactoryGirl.create :item_type
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_type" do
    assert_difference('ItemType.count') do
      post :create, item_type: @item_type.attributes
    end

    assert_redirected_to admin_item_type_path(assigns(:item_type))
  end

  test "should show item_type" do
    get :show, id: @item_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_type
    assert_response :success
  end

  test "should update item_type" do
    put :update, id: @item_type, item_type: @item_type.attributes
    assert_redirected_to admin_item_type_path(assigns(:item_type))
  end

  test "should destroy item_type" do
    assert_difference('ItemType.count', -1) do
      delete :destroy, id: @item_type
    end

    assert_redirected_to admin_item_types_path
  end
end
