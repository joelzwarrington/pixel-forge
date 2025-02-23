require "test_helper"

class InventoryItemTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert inventory_items.all?(&:valid?)
  end

  test "weight is calculated" do
    inventory_item = InventoryItem.new(character: characters(:joel), item: items(:copper_ore), quantity: 1)

    inventory_item.validate
    assert_equal inventory_item.weight, 10

    inventory_item.quantity = 5
    inventory_item.validate
    assert_equal inventory_item.weight, 50
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

  test "weight must be a number and greater than or equal to 0" do
    item = Item.new
    assert_not item.valid?
    assert item.errors.added?(:weight, :not_a_number, value: item.weight)

    item.weight = -1
    assert_not item.valid?
    assert item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)

    item.weight = 0
    assert_not item.valid?
    assert_not item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)

    item.weight = 1
    assert_not item.valid?
    assert_not item.errors.added?(:weight, :greater_than_or_equal_to, count: 0, value: item.weight)
  end
end
