class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.belongs_to :character, null: false, foreign_key: true
      t.string :location_id, index: true
      t.text :body

      t.timestamps
    end
  end
end
