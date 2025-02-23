require "test_helper"

class NodeLootPoolItemTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert node_loot_pool_items.all?(&:valid?)
  end
end
