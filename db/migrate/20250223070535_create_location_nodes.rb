class CreateLocationNodes < ActiveRecord::Migration[8.0]
  def change
    create_table :location_nodes do |t|
      t.references :location, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true

      t.timestamps
    end
  end
end
