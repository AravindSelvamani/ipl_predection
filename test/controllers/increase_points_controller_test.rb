require 'test_helper'

class IncreasePointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @increase_point = increase_points(:one)
  end

  test "should get index" do
    get increase_points_url
    assert_response :success
  end

  test "should get new" do
    get new_increase_point_url
    assert_response :success
  end

  test "should create increase_point" do
    assert_difference('IncreasePoint.count') do
      post increase_points_url, params: { increase_point: { date: @increase_point.date, winner1: @increase_point.winner1, winner2: @increase_point.winner2 } }
    end

    assert_redirected_to increase_point_url(IncreasePoint.last)
  end

  test "should show increase_point" do
    get increase_point_url(@increase_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_increase_point_url(@increase_point)
    assert_response :success
  end

  test "should update increase_point" do
    patch increase_point_url(@increase_point), params: { increase_point: { date: @increase_point.date, winner1: @increase_point.winner1, winner2: @increase_point.winner2 } }
    assert_redirected_to increase_point_url(@increase_point)
  end

  test "should destroy increase_point" do
    assert_difference('IncreasePoint.count', -1) do
      delete increase_point_url(@increase_point)
    end

    assert_redirected_to increase_points_url
  end
end
