class ReplaceNodesWithFrozenRecords < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :location_nodes, :nodes  if foreign_key_exists?(:location_nodes, :nodes)
    remove_foreign_key :node_loot_pool_items, :node_loot_pools  if foreign_key_exists?(:node_loot_pool_items, :node_loot_pools)
    remove_foreign_key :node_loot_pools, :nodes  if foreign_key_exists?(:node_loot_pools, :nodes)

    drop_table :location_nodes
    drop_table :node_loot_pool_items
    drop_table :node_loot_pools
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
