class CreateNodeLootPools < ActiveRecord::Migration[8.0]
  def change
    create_table :node_loot_pools do |t|
      t.references :node, null: false, foreign_key: true
      t.integer :weight

      t.timestamps
    end
  end
end
