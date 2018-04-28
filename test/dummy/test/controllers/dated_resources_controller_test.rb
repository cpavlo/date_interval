require 'test_helper'

class DatedResourcesControllerTest < ActionController::TestCase
  setup do
    @dated_resource = dateds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dated_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dated" do
    assert_difference('Dated.count') do
      post :create, dated_resource: { date: @dated_resource.date, name: @dated_resource.name }
    end

    assert_redirected_to datedResource_path(assigns(:dated_resource))
  end

  test "should show dated" do
    get :show, id: @dated_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dated_resource
    assert_response :success
  end

  test "should update dated" do
    patch :update, id: @dated_resource, dated_resource: { date: @dated_resource.date, name: @dated_resource.name }
    assert_redirected_to datedResource_path(assigns(:dated_resource))
  end

  test "should destroy dated" do
    assert_difference('Dated.count', -1) do
      delete :destroy, id: @dated_resource
    end

    assert_redirected_to datedResourceResources_path
  end
end
