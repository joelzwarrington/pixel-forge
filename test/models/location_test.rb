require "test_helper"

class LocationTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert locations.all?(&:valid?)
  end

  test "name must be present" do
    location = Location.new
    assert_not location.valid?
    assert location.errors.added?(:name, :blank)

    location.name = "Lorem Ipsum"
    assert location.valid?
  end
end
