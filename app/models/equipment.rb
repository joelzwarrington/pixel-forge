class Equipment
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def equip(slot, item)
    unequip(slot)

    EquipmentItem.transaction do
      InventoryItem.transaction do
        character.inventory.remove([ [ item.id, 1 ] ])
        character.equipment_items.create!(item: item, slot: slot)
      end
    end
  end

  def unequip(slot)
    EquipmentItem.transaction do
      InventoryItem.transaction do
        equipment_items = character.equipment_items.destroy_by(slot: slot)
        items_to_add = equipment_items.map do |equipment_item|
          [ equipment_item.item, 1 ]
        end
        character.inventory.add(items_to_add)
      end
    end
  end

  def all
    equipped = EquipmentItem::SLOTS.to_h { |slot| [ slot, nil ] }
    character.equipment_items.each do |equipment_item|
      equipped[equipment_item.slot] = equipment_item.item
    end

    equipped
  end

  def equipped?(slot: nil, item: nil)
    opts = { slot:, item: }.compact
    character.equipment_items.exists?(opts)
  end

  def to_partial_path
    "equipment/equipment"
  end
end
