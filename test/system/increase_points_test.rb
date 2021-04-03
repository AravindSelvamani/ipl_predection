require "application_system_test_case"

class IncreasePointsTest < ApplicationSystemTestCase
  setup do
    @increase_point = increase_points(:one)
  end

  test "visiting the index" do
    visit increase_points_url
    assert_selector "h1", text: "Increase Points"
  end

  test "creating a Increase point" do
    visit increase_points_url
    click_on "New Increase Point"

    fill_in "Date", with: @increase_point.date
    fill_in "Winner1", with: @increase_point.winner1
    fill_in "Winner2", with: @increase_point.winner2
    click_on "Create Increase point"

    assert_text "Increase point was successfully created"
    click_on "Back"
  end

  test "updating a Increase point" do
    visit increase_points_url
    click_on "Edit", match: :first

    fill_in "Date", with: @increase_point.date
    fill_in "Winner1", with: @increase_point.winner1
    fill_in "Winner2", with: @increase_point.winner2
    click_on "Update Increase point"

    assert_text "Increase point was successfully updated"
    click_on "Back"
  end

  test "destroying a Increase point" do
    visit increase_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Increase point was successfully destroyed"
  end
end
