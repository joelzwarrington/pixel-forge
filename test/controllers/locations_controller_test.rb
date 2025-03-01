require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = Location.find("gor_kash")
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end
end
