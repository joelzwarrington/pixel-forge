require "test_helper"

class EquipmentItemTest < ActiveSupport::TestCase
  test "each fixture is valid" do
    assert equipment_items.all?(&:valid?)
  end

  test "can't equip multiple items to the same slot" do
    equipment_item = EquipmentItem.new(character: characters(:joel), item_id: "wooden_sword", slot: "main_hand")

    assert_not equipment_item.valid?
    assert equipment_item.errors.added?(:slot, :taken, value: equipment_item.slot)

    equipment_item.slot = "head"
    assert equipment_item.valid?
  end

  test "can't equip to invalid slot" do
    equipment_item = EquipmentItem.new(character: characters(:joel), item_id: "wooden_sword", slot: "non_existant")

    assert_not equipment_item.valid?
    assert equipment_item.errors.added?(:slot, :inclusion, value: equipment_item.slot)

    equipment_item.slot = "head"
    equipment_item.valid?
  end

  test "slot must be specified" do
    equipment_item = EquipmentItem.new(character: characters(:joel), item_id: "wooden_sword")

    assert_not equipment_item.valid?
    assert equipment_item.errors.added?(:slot, :blank)

    equipment_item.slot = "head"
    equipment_item.valid?
  end
end
