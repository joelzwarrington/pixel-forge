class Inventory
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def items
    character.inventory_items.all.map do |inventory_item|
      [ inventory_item.item, inventory_item.quantity ]
    end
  end

  def add(items_to_add)
    inventory_items = character.inventory_items.where(item_id: items_to_add.map { |item, quantity| item.id })

    items_to_add.each do |item, quantity|
      inventory_item = inventory_items.find { |inventory_item| inventory_item.item_id == item.id }

      if inventory_item.nil?
        character.inventory_items.build(item_id: item.id, quantity: quantity)
      else
        inventory_item.quantity += quantity
        inventory_item.save
      end
    end

    character.save
  end

  def remove(items_to_remove)
    inventory_items = character.inventory_items.where(item_id: items_to_remove.map { |item, quantity| item.id })

    items_to_remove.each do |item, quantity|
      inventory_item = inventory_items.find { |inventory_item| inventory_item.item_id == item.id }

      raise "item not in inventory" if inventory_item.nil?

      if (new_quantity = inventory_item.quantity - quantity).positive?
        inventory_item.update(quantity: new_quantity)
      elsif new_quantity.zero?
        inventory_item.destroy
      else
        raise "not enough items to remove"
      end
    end
  end

  def to_partial_path
    "inventory/inventory"
  end
end
