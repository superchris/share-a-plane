require 'test_helper'

class BuyingGroupsControllerTest < ActionController::TestCase
  setup do
    @buying_group = buying_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buying_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buying_group" do
    assert_difference('BuyingGroup.count') do
      post :create, buying_group: { aircraft_type: @buying_group.aircraft_type, cost: @buying_group.cost, engine_time: @buying_group.engine_time, hangar_fee: @buying_group.hangar_fee, tboh: @buying_group.tboh }
    end

    assert_redirected_to buying_group_path(assigns(:buying_group))
  end

  test "should show buying_group" do
    get :show, id: @buying_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buying_group
    assert_response :success
  end

  test "should update buying_group" do
    patch :update, id: @buying_group, buying_group: { aircraft_type: @buying_group.aircraft_type, cost: @buying_group.cost, engine_time: @buying_group.engine_time, hangar_fee: @buying_group.hangar_fee, tboh: @buying_group.tboh }
    assert_redirected_to buying_group_path(assigns(:buying_group))
  end

  test "should destroy buying_group" do
    assert_difference('BuyingGroup.count', -1) do
      delete :destroy, id: @buying_group
    end

    assert_redirected_to buying_groups_path
  end
end
