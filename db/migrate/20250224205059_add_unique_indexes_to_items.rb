class AddUniqueIndexesToItems < ActiveRecord::Migration[8.0]
  def change
    add_index :inventory_items, [ :item_id, :character_id ], unique: true
    add_index :equipment_items, [ :item_id, :character_id, :slot ], unique: true
  end
end
