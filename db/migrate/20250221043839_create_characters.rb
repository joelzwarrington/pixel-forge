class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name, index: { unique: true }

      t.timestamps
    end
  end
end
