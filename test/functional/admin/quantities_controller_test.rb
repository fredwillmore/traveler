require 'test_helper'

class Admin::QuantitiesControllerTest < ActionController::TestCase
  setup do
    @user = FactoryBot.create :user
    @quantity = FactoryBot.create :quantity
    sign_in User.first
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quantities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quantity" do
    assert_difference('Quantity.count') do
      post :create, quantity: @quantity.attributes
    end

    assert_redirected_to admin_quantity_path(assigns(:quantity))
  end

  test "should show quantity" do
    get :show, id: @quantity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quantity
    assert_response :success
  end

  test "should update quantity" do
    put :update, id: @quantity, quantity: @quantity.attributes
    assert_redirected_to admin_quantity_path(assigns(:quantity))
  end

  test "should destroy quantity" do
    assert_difference('Quantity.count', -1) do
      delete :destroy, id: @quantity
    end

    assert_redirected_to admin_quantities_path
  end
end
