class CreateEquipmentItems < ActiveRecord::Migration[8.0]
  def change
    create_table :equipment_items do |t|
      t.references :character, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :slot

      t.timestamps

      t.index [ :character_id, :slot ], unique: true
    end
  end
end
