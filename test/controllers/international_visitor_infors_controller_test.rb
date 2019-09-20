require 'test_helper'

class InternationalVisitorInforsControllerTest < ActionController::TestCase
  setup do
    @international_visitor_infor = international_visitor_infors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:international_visitor_infors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create international_visitor_infor" do
    assert_difference('InternationalVisitorInfor.count') do
      post :create, international_visitor_infor: { africa: @international_visitor_infor.africa, america: @international_visitor_infor.america, asia: @international_visitor_infor.asia, europe: @international_visitor_infor.europe, visitor_info_id: @international_visitor_infor.visitor_info_id }
    end

    assert_redirected_to international_visitor_infor_path(assigns(:international_visitor_infor))
  end

  test "should show international_visitor_infor" do
    get :show, id: @international_visitor_infor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @international_visitor_infor
    assert_response :success
  end

  test "should update international_visitor_infor" do
    patch :update, id: @international_visitor_infor, international_visitor_infor: { africa: @international_visitor_infor.africa, america: @international_visitor_infor.america, asia: @international_visitor_infor.asia, europe: @international_visitor_infor.europe, visitor_info_id: @international_visitor_infor.visitor_info_id }
    assert_redirected_to international_visitor_infor_path(assigns(:international_visitor_infor))
  end

  test "should destroy international_visitor_infor" do
    assert_difference('InternationalVisitorInfor.count', -1) do
      delete :destroy, id: @international_visitor_infor
    end

    assert_redirected_to international_visitor_infors_path
  end
end
