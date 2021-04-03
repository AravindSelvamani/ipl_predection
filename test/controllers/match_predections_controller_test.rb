require 'test_helper'

class MatchPredectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @match_predection = match_predections(:one)
  end

  test "should get index" do
    get match_predections_url
    assert_response :success
  end

  test "should get new" do
    get new_match_predection_url
    assert_response :success
  end

  test "should create match_predection" do
    assert_difference('MatchPredection.count') do
      post match_predections_url, params: { match_predection: { date: @match_predection.date, name: @match_predection.name, winners: @match_predection.winners } }
    end

    assert_redirected_to match_predection_url(MatchPredection.last)
  end

  test "should show match_predection" do
    get match_predection_url(@match_predection)
    assert_response :success
  end

  test "should get edit" do
    get edit_match_predection_url(@match_predection)
    assert_response :success
  end

  test "should update match_predection" do
    patch match_predection_url(@match_predection), params: { match_predection: { date: @match_predection.date, name: @match_predection.name, winners: @match_predection.winners } }
    assert_redirected_to match_predection_url(@match_predection)
  end

  test "should destroy match_predection" do
    assert_difference('MatchPredection.count', -1) do
      delete match_predection_url(@match_predection)
    end

    assert_redirected_to match_predections_url
  end
end
