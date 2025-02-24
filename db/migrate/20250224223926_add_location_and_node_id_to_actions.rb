class AddLocationAndNodeIdToActions < ActiveRecord::Migration[8.0]
  def change
    change_table :actions do |t|
      t.string :location_id, index: true
      t.string :node_id, index: true
      t.remove :location_node_id
    end

    remove_foreign_key :actions, :location_nodes  if foreign_key_exists?(:actions, :location_nodes)
  end
end
