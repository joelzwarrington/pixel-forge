require "test_helper"

class EquipmentControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:joel)
  end

  test "should get new" do
    get new_character_equipment_url(@character, slot: "head")
    assert_response :success
  end

  test "should equip item" do
    post character_equipment_url(@character), params: { slot: "off_hand", item_id: "copper_ore" }
    assert_redirected_to character_equipment_url(@character)
  end

  test "should show equipment" do
    get character_equipment_url(@character)
    assert_response :success
  end

  test "should unequip item" do
    assert_difference("EquipmentItem.count", -1) do
      delete character_equipment_url(@character, slot: "main_hand")
    end

    assert_redirected_to character_equipment_url(@character)
  end
end
