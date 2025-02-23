class CreateNodeLootPoolItems < ActiveRecord::Migration[8.0]
  def change
    create_table :node_loot_pool_items do |t|
      t.references :node_loot_pool, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :min_quantity
      t.integer :max_quantity

      t.timestamps

      t.index [ :node_loot_pool_id, :item_id ], unique: true
    end
  end
end
