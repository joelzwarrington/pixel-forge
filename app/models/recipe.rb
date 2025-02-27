class Recipe < FrozenRecord::Base
  def items
    attributes["items"].map do |data|
      item_id, quantity = data.values_at("id", "quantity")
      [ Item.find(item_id), quantity ]
    end
  end

  def materials
    attributes["materials"].map do |data|
      item_id, quantity = data.values_at("id", "quantity")
      [ Item.find(item_id), quantity ]
    end
  end
end
