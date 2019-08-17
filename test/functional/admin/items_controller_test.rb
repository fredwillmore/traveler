require 'test_helper'

class Admin::ItemsControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @item = FactoryBot.create :item
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: @item.attributes
    end

    assert_redirected_to admin_item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    put :update, id: @item, item: @item.attributes
    assert_redirected_to admin_item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to admin_items_path
  end
end
