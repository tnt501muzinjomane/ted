require 'test_helper'

class SwaziVisitorInfosControllerTest < ActionController::TestCase
  setup do
    @swazi_visitor_info = swazi_visitor_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swazi_visitor_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swazi_visitor_info" do
    assert_difference('SwaziVisitorInfo.count') do
      post :create, swazi_visitor_info: { place_of_residence: @swazi_visitor_info.place_of_residence, visitor_info_id: @swazi_visitor_info.visitor_info_id }
    end

    assert_redirected_to swazi_visitor_info_path(assigns(:swazi_visitor_info))
  end

  test "should show swazi_visitor_info" do
    get :show, id: @swazi_visitor_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swazi_visitor_info
    assert_response :success
  end

  test "should update swazi_visitor_info" do
    patch :update, id: @swazi_visitor_info, swazi_visitor_info: { place_of_residence: @swazi_visitor_info.place_of_residence, visitor_info_id: @swazi_visitor_info.visitor_info_id }
    assert_redirected_to swazi_visitor_info_path(assigns(:swazi_visitor_info))
  end

  test "should destroy swazi_visitor_info" do
    assert_difference('SwaziVisitorInfo.count', -1) do
      delete :destroy, id: @swazi_visitor_info
    end

    assert_redirected_to swazi_visitor_infos_path
  end
end
