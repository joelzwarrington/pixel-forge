class DropLocationsInFavourOfFrozenRecords < ActiveRecord::Migration[8.0]
  def up
    remove_foreign_key :characters, :locations  if foreign_key_exists?(:characters, :locations)
    change_table :characters do |t|
      t.change :location_id, :string
    end

    remove_foreign_key :location_nodes, :locations  if foreign_key_exists?(:location_nodes, :locations)
    change_table :location_nodes do |t|
      t.change :location_id, :string
    end

    drop_table :locations
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
