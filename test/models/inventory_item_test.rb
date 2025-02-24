require "test_helper"

class InventoryItemTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert inventory_items.all?(&:valid?)
  end

  test "quantity must be a number and greater than or equal to 0" do
    inventory_item = InventoryItem.new
    assert_not inventory_item.valid?
    assert inventory_item.errors.added?(:quantity, :not_a_number, value: inventory_item.quantity)

    inventory_item.quantity = -1
    assert_not inventory_item.valid?
    assert inventory_item.errors.added?(:quantity, :greater_than, count: 0, value: inventory_item.quantity)

    inventory_item.quantity = 0
    assert_not inventory_item.valid?
    assert inventory_item.errors.added?(:quantity, :greater_than, count: 0, value: inventory_item.quantity)

    inventory_item.quantity = 1
    assert_not inventory_item.valid?
    assert_not inventory_item.errors.added?(:quantity, :greater_than, count: 0, value: inventory_item.quantity)
  end
end
