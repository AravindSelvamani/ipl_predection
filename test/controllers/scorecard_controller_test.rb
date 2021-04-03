require 'test_helper'

class ScorecardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scorecard_index_url
    assert_response :success
  end

end
