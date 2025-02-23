require "test_helper"

class NodeLootPoolTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert node_loot_pools.all?(&:valid?)
  end
end
