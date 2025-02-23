require "test_helper"

class EquipmentTest < ActiveSupport::TestCase
  test "#all returns all equipped items by slot" do
    equipment = Equipment.new(characters(:joel))

    expected = {
      "head" => nil,
      "shoulders" => nil,
      "chest" => nil,
      "wrist" => nil,
      "hands" => nil,
      "waist" => nil,
      "legs" => nil,
      "feet" => nil,
      "neck" => nil,
      "back" => nil,
      "finger_one" => nil,
      "finger_two" => nil,
      "main_hand" => items(:wooden_sword),
      "off_hand" => nil
    }

    assert_equal expected, equipment.all
  end

  test "#equipped? detects what items/slots are equipped" do
    equipment = Equipment.new(characters(:joel))

    assert equipment.equipped?
    assert equipment.equipped?(slot: "main_hand")
    assert equipment.equipped?(item: items(:wooden_sword))
    assert equipment.equipped?(slot: "main_hand", item: items(:wooden_sword))
    assert_not equipment.equipped?(slot: "head", item: items(:wooden_sword))

    assert_not equipment.equipped?(item: items(:copper_ore))
    assert_not equipment.equipped?(slot: "main_hand", item: items(:copper_ore))
  end

  test "#equip equips item if it exists in inventory" do
    character = characters(:joel)
    equipment = Equipment.new(character)

    assert_difference -> { EquipmentItem.count } do
      equipment.equip("off_hand", items(:copper_ore))
    end

    assert equipment.equipped?(slot: "main_hand", item: items(:wooden_sword))
    assert equipment.equipped?(slot: "off_hand", item: items(:copper_ore))
    items = character.inventory.items
    assert_equal 1, items.count
    assert_equal 49, items.first.second
  end

  test "#equip unequips item in slot" do
    character = characters(:joel)
    equipment = Equipment.new(character)

    assert_no_difference -> { EquipmentItem.count } do
      equipment.equip("main_hand", items(:copper_ore))
    end

    assert equipment.equipped?(slot: "main_hand", item: items(:copper_ore))
    items = character.inventory.items
    assert_equal 2, items.count
    assert_equal 49, items.first.second
    assert_equal 1, items.second.second
  end

  test "#unequip unequips item in slot" do
    character = characters(:joel)
    equipment = Equipment.new(character)

    assert_difference -> { EquipmentItem.count }, -1 do
      equipment.unequip("main_hand")
    end

    assert_not equipment.equipped?(slot: "main_hand")
    items = character.inventory.items
    assert_equal 2, items.count
    assert_equal 50, items.first.second
    assert_equal 1, items.second.second
  end
end
