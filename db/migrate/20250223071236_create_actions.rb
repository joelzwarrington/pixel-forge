class CreateActions < ActiveRecord::Migration[8.0]
  def change
    create_table :actions do |t|
      t.references :location_node, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :stopped_at
      t.string :seed
      t.datetime :next_tick_at
      t.datetime :last_tick_at

      t.timestamps
    end
  end
end
