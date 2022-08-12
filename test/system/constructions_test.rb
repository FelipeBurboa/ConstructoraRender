require "application_system_test_case"

class ConstructionsTest < ApplicationSystemTestCase
  setup do
    @construction = constructions(:one)
  end

  test "visiting the index" do
    visit constructions_url
    assert_selector "h1", text: "Constructions"
  end

  test "should create construction" do
    visit constructions_url
    click_on "New construction"

    fill_in "City", with: @construction.city
    fill_in "Cost", with: @construction.cost
    fill_in "Enddate", with: @construction.enddate
    fill_in "Name", with: @construction.name
    fill_in "Number", with: @construction.number
    fill_in "Postcode", with: @construction.postcode
    fill_in "Startdate", with: @construction.startdate
    fill_in "State", with: @construction.state
    fill_in "Street", with: @construction.street
    click_on "Create Construction"

    assert_text "Construction was successfully created"
    click_on "Back"
  end

  test "should update Construction" do
    visit construction_url(@construction)
    click_on "Edit this construction", match: :first

    fill_in "City", with: @construction.city
    fill_in "Cost", with: @construction.cost
    fill_in "Enddate", with: @construction.enddate
    fill_in "Name", with: @construction.name
    fill_in "Number", with: @construction.number
    fill_in "Postcode", with: @construction.postcode
    fill_in "Startdate", with: @construction.startdate
    fill_in "State", with: @construction.state
    fill_in "Street", with: @construction.street
    click_on "Update Construction"

    assert_text "Construction was successfully updated"
    click_on "Back"
  end

  test "should destroy Construction" do
    visit construction_url(@construction)
    click_on "Destroy this construction", match: :first

    assert_text "Construction was successfully destroyed"
  end
end
