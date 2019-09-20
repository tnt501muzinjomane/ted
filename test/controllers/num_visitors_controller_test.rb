require 'test_helper'

class NumVisitorsControllerTest < ActionController::TestCase
  setup do
    @num_visitor = num_visitors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:num_visitors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create num_visitor" do
    assert_difference('NumVisitor.count') do
      post :create, num_visitor: { numv: @num_visitor.numv, visitor_infor_id: @num_visitor.visitor_infor_id }
    end

    assert_redirected_to num_visitor_path(assigns(:num_visitor))
  end

  test "should show num_visitor" do
    get :show, id: @num_visitor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @num_visitor
    assert_response :success
  end

  test "should update num_visitor" do
    patch :update, id: @num_visitor, num_visitor: { numv: @num_visitor.numv, visitor_infor_id: @num_visitor.visitor_infor_id }
    assert_redirected_to num_visitor_path(assigns(:num_visitor))
  end

  test "should destroy num_visitor" do
    assert_difference('NumVisitor.count', -1) do
      delete :destroy, id: @num_visitor
    end

    assert_redirected_to num_visitors_path
  end
end
