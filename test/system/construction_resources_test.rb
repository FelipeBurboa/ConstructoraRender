require "application_system_test_case"

class ConstructionResourcesTest < ApplicationSystemTestCase
  setup do
    @construction_resource = construction_resources(:one)
  end

  test "visiting the index" do
    visit construction_resources_url
    assert_selector "h1", text: "Construction resources"
  end

  test "should create construction resource" do
    visit construction_resources_url
    click_on "New construction resource"

    fill_in "Construction", with: @construction_resource.construction_id
    fill_in "Quantity", with: @construction_resource.quantity
    fill_in "Resource", with: @construction_resource.resource_id
    click_on "Create Construction resource"

    assert_text "Construction resource was successfully created"
    click_on "Back"
  end

  test "should update Construction resource" do
    visit construction_resource_url(@construction_resource)
    click_on "Edit this construction resource", match: :first

    fill_in "Construction", with: @construction_resource.construction_id
    fill_in "Quantity", with: @construction_resource.quantity
    fill_in "Resource", with: @construction_resource.resource_id
    click_on "Update Construction resource"

    assert_text "Construction resource was successfully updated"
    click_on "Back"
  end

  test "should destroy Construction resource" do
    visit construction_resource_url(@construction_resource)
    click_on "Destroy this construction resource", match: :first

    assert_text "Construction resource was successfully destroyed"
  end
end
