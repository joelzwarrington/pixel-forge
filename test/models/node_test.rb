require "test_helper"

class NodeTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert nodes.all?(&:valid?)
  end
end
