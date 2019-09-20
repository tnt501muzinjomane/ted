require 'test_helper'

class VisitorPackagesControllerTest < ActionController::TestCase
  setup do
    @visitor_package = visitor_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitor_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitor_package" do
    assert_difference('VisitorPackage.count') do
      post :create, visitor_package: { package_id: @visitor_package.package_id, visitor_infor_id: @visitor_package.visitor_infor_id }
    end

    assert_redirected_to visitor_package_path(assigns(:visitor_package))
  end

  test "should show visitor_package" do
    get :show, id: @visitor_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @visitor_package
    assert_response :success
  end

  test "should update visitor_package" do
    patch :update, id: @visitor_package, visitor_package: { package_id: @visitor_package.package_id, visitor_infor_id: @visitor_package.visitor_infor_id }
    assert_redirected_to visitor_package_path(assigns(:visitor_package))
  end

  test "should destroy visitor_package" do
    assert_difference('VisitorPackage.count', -1) do
      delete :destroy, id: @visitor_package
    end

    assert_redirected_to visitor_packages_path
  end
end
