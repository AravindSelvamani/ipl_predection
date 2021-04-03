require "application_system_test_case"

class MatchPredectionsTest < ApplicationSystemTestCase
  setup do
    @match_predection = match_predections(:one)
  end

  test "visiting the index" do
    visit match_predections_url
    assert_selector "h1", text: "Match Predections"
  end

  test "creating a Match predection" do
    visit match_predections_url
    click_on "New Match Predection"

    fill_in "Date", with: @match_predection.date
    fill_in "Name", with: @match_predection.name
    fill_in "Winners", with: @match_predection.winners
    click_on "Create Match predection"

    assert_text "Match predection was successfully created"
    click_on "Back"
  end

  test "updating a Match predection" do
    visit match_predections_url
    click_on "Edit", match: :first

    fill_in "Date", with: @match_predection.date
    fill_in "Name", with: @match_predection.name
    fill_in "Winners", with: @match_predection.winners
    click_on "Update Match predection"

    assert_text "Match predection was successfully updated"
    click_on "Back"
  end

  test "destroying a Match predection" do
    visit match_predections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Match predection was successfully destroyed"
  end
end
