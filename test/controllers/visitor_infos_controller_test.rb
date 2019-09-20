require 'test_helper'

class VisitorInfosControllerTest < ActionController::TestCase
  setup do
    @visitor_info = visitor_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitor_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor_info" do
    assert_difference('VisitorInfo.count') do
      post :create, visitor_info: { Below_18: @visitor_info.Below_18, age18_24: @visitor_info.age18_24, age25_34: @visitor_info.age25_34, age35_44: @visitor_info.age35_44, age45_54: @visitor_info.age45_54, age55_64: @visitor_info.age55_64, age65: @visitor_info.age65, citizenship: @visitor_info.citizenship, country: @visitor_info.country, date_of_arrival: @visitor_info.date_of_arrival, gender: @visitor_info.gender, mode_of_transport: @visitor_info.mode_of_transport, name: @visitor_info.name, partner: @visitor_info.partner, reason_for_vist: @visitor_info.reason_for_vist, surname: @visitor_info.surname, travel: @visitor_info.travel, user_id: @visitor_info.user_id }
    end

    assert_redirected_to visitor_info_path(assigns(:visitor_info))
  end

  test "should show visitor_info" do
    get :show, id: @visitor_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitor_info
    assert_response :success
  end

  test "should update visitor_info" do
    patch :update, id: @visitor_info, visitor_info: { Below_18: @visitor_info.Below_18, age18_24: @visitor_info.age18_24, age25_34: @visitor_info.age25_34, age35_44: @visitor_info.age35_44, age45_54: @visitor_info.age45_54, age55_64: @visitor_info.age55_64, age65: @visitor_info.age65, citizenship: @visitor_info.citizenship, country: @visitor_info.country, date_of_arrival: @visitor_info.date_of_arrival, gender: @visitor_info.gender, mode_of_transport: @visitor_info.mode_of_transport, name: @visitor_info.name, partner: @visitor_info.partner, reason_for_vist: @visitor_info.reason_for_vist, surname: @visitor_info.surname, travel: @visitor_info.travel, user_id: @visitor_info.user_id }
    assert_redirected_to visitor_info_path(assigns(:visitor_info))
  end

  test "should destroy visitor_info" do
    assert_difference('VisitorInfo.count', -1) do
      delete :destroy, id: @visitor_info
    end

    assert_redirected_to visitor_infos_path
  end
end
