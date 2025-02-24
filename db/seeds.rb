items_to_add = [
  # wooden
  { name: "Log", ilvl: 0, weight: 100 },
  { name: "Wooden Sword", ilvl: 0, weight: 10_000 },
  { name: "Wooden Spear", ilvl: 0, weight: 10_000 },
  { name: "Wooden Staff", ilvl: 0, weight: 10_000 },
  { name: "Wooden Bow", ilvl: 0, weight: 10_000 },
  { name: "Wooden Shield", ilvl: 0, weight: 10_000 },

  # copper
  { name: "Copper Ore", ilvl: 5, weight: 150 },
  { name: "Copper Ingot", ilvl: 5, weight: 150 },
  { name: "Copper Sword", ilvl: 5, weight: 15_000 },
  { name: "Copper Spear", ilvl: 5, weight: 15_000 },
  { name: "Copper Staff", ilvl: 5, weight: 15_000 },
  { name: "Copper Bow", ilvl: 5, weight: 15_000 },
  { name: "Copper Shield", ilvl: 5, weight: 15_000 },

  # iron
  { name: "Iron Ore", ilvl: 5, weight: 150 },
  { name: "Iron Ingot", ilvl: 5, weight: 150 },
  { name: "Iron Sword", ilvl: 10, weight: 15_000 },
  { name: "Iron Spear", ilvl: 10, weight: 15_000 },
  { name: "Iron Staff", ilvl: 10, weight: 15_000 },
  { name: "Iron Bow", ilvl: 10, weight: 25_000 },
  { name: "Iron Shield", ilvl: 10, weight: 25_000 },
  { name: "Iron Helmet", ilvl: 10, weight: 25_000 },
  { name: "Iron Chestpiece", ilvl: 10, weight: 25_000 },
  { name: "Iron Leggings", ilvl: 10, weight: 25_000 },
  { name: "Iron Boots", ilvl: 10, weight: 25_000 }
].map do |item_attrs|
  [ Item.create!(item_attrs), 1 ]
end

Location.create!(name: "Town")
Location.create!(name: "Wilderness")

character = Character.create!(name: "joel")
character.inventory.add(items_to_add)

character.equipment.equip("head", Item.find_by(name: "Iron Helmet"))
character.equipment.equip("chest", Item.find_by(name: "Iron Chestpiece"))
character.equipment.equip("legs", Item.find_by(name: "Iron Leggings"))
character.equipment.equip("feet", Item.find_by(name: "Iron Boots"))
character.equipment.equip("main_hand", Item.find_by(name: "Iron Sword"))
character.equipment.equip("off_hand", Item.find_by(name: "Iron Shield"))
