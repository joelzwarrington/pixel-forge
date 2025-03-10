require "test_helper"

class InventoryTest < ActiveSupport::TestCase
  test "#items lists items in inventory with counts" do
    inventory = Inventory.new(characters(:joel))
    assert_equal 1, inventory.items.count
    assert_equal Item.find("copper_ore"), inventory.items.first.first
    assert_equal 50, inventory.items.first.second
  end

  test "#add adds items to inventory" do
    inventory = Inventory.new(characters(:joel))
    assert_equal 1, inventory.items.count

    assert_difference -> { InventoryItem.count } do
      inventory.add([
        [ Item.find("iron_ore"), 1 ]
      ])
    end

    assert_equal 2, inventory.items.count
  end

  test "#add increases quantity of existing item in inventory" do
    inventory = Inventory.new(characters(:joel))
    items = inventory.items
    assert_equal 1, items.count
    assert_equal 50, items.first.second

    assert_no_difference -> { InventoryItem.count } do
      inventory.add([
        [ Item.find("copper_ore"), 1 ]
      ])
    end

    items = inventory.items

    assert_equal 51, items.first.second
  end

  test "#remove removes items from inventory" do
    inventory = Inventory.new(characters(:joel))
    items = inventory.items
    assert_equal 1, items.count
    assert_equal 50, items.first.second

    assert_difference -> { InventoryItem.count }, -1 do
      inventory.remove([
        [ Item.find("copper_ore"), 50 ]
      ])
    end

    assert_equal 0, inventory.items.count
  end

  test "#remove fails when item not in inventory" do
    inventory = Inventory.new(characters(:joel))
    items = inventory.items
    assert_equal 1, items.count
    assert_equal 50, items.first.second

    assert_raises RuntimeError, "item not in inventory" do
      inventory.remove([
        [ Item.find("wooden_sword"), 1 ]
      ])
    end
  end

  test "#remove decrements quantity of existing item in inventory" do
    inventory = Inventory.new(characters(:joel))
    items = inventory.items
    assert_equal 1, items.count
    assert_equal 50, items.first.second

    assert_no_difference -> { InventoryItem.count } do
      inventory.remove([
        [ Item.find("copper_ore"), 25 ]
      ])
    end

    items = inventory.items
    assert_equal 1, items.count
    assert_equal 25, items.first.second
  end

  test "#remove raises error when removing more than what exists in inventory" do
    inventory = Inventory.new(characters(:joel))
    items = inventory.items
    assert_equal 1, items.count
    assert_equal 50, items.first.second

    assert_raises RuntimeError, "not enough items to remove" do
      inventory.remove([
        [ Item.find("copper_ore"), 51 ]
      ])
    end
  end
end
