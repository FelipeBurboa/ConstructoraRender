require "test_helper"

class ConstructionResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @construction_resource = construction_resources(:one)
  end

  test "should get index" do
    get construction_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_construction_resource_url
    assert_response :success
  end

  test "should create construction_resource" do
    assert_difference("ConstructionResource.count") do
      post construction_resources_url, params: { construction_resource: { construction_id: @construction_resource.construction_id, quantity: @construction_resource.quantity, resource_id: @construction_resource.resource_id } }
    end

    assert_redirected_to construction_resource_url(ConstructionResource.last)
  end

  test "should show construction_resource" do
    get construction_resource_url(@construction_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_construction_resource_url(@construction_resource)
    assert_response :success
  end

  test "should update construction_resource" do
    patch construction_resource_url(@construction_resource), params: { construction_resource: { construction_id: @construction_resource.construction_id, quantity: @construction_resource.quantity, resource_id: @construction_resource.resource_id } }
    assert_redirected_to construction_resource_url(@construction_resource)
  end

  test "should destroy construction_resource" do
    assert_difference("ConstructionResource.count", -1) do
      delete construction_resource_url(@construction_resource)
    end

    assert_redirected_to construction_resources_url
  end
end
