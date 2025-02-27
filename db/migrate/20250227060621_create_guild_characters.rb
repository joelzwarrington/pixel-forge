class CreateGuildCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :guild_characters do |t|
      t.belongs_to :guild, null: false, foreign_key: true
      t.belongs_to :character, null: false, foreign_key: true, index: { unique: true }
      t.string :role

      t.timestamps
    end
  end
end
