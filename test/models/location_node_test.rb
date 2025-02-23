require "test_helper"

class LocationNodeTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert location_nodes.all?(&:valid?)
  end
end
