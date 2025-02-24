class DropItemsInFavourOfFrozenRecords < ActiveRecord::Migration[8.0]
  def up
    change_table :inventory_items do |t|
      t.change :item_id, :string
    end
    remove_foreign_key :inventory_items, :items if foreign_key_exists?(:inventory_items, :items)

    change_table :equipment_items do |t|
      t.change :item_id, :string
    end
    remove_foreign_key :equipment_items, :items  if foreign_key_exists?(:equipment_items, :items)

    change_table :node_loot_pool_items do |t|
      t.change :item_id, :string
    end
    remove_foreign_key :node_loot_pool_items, :items  if foreign_key_exists?(:node_loot_pool_items, :items)

    drop_table :items
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
