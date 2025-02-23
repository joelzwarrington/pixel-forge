require "test_helper"

class EquipmentItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_item = equipment_items(:joel_wooden_sword)
  end

  test "should get index" do
    get equipment_items_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_item_url
    assert_response :success
  end

  test "should create equipment_item" do
    assert_difference("EquipmentItem.count") do
      post equipment_items_url, params: { equipment_item: { character_id: @equipment_item.character_id, item_id: @equipment_item.item_id, slot: "off_hand" } }
    end

    assert_redirected_to equipment_item_url(EquipmentItem.last)
  end

  test "should show equipment_item" do
    get equipment_item_url(@equipment_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_item_url(@equipment_item)
    assert_response :success
  end

  test "should update equipment_item" do
    patch equipment_item_url(@equipment_item), params: { equipment_item: { character_id: @equipment_item.character_id, item_id: @equipment_item.item_id, slot: @equipment_item.slot } }
    assert_redirected_to equipment_item_url(@equipment_item)
  end

  test "should destroy equipment_item" do
    assert_difference("EquipmentItem.count", -1) do
      delete equipment_item_url(@equipment_item)
    end

    assert_redirected_to equipment_items_url
  end
end
