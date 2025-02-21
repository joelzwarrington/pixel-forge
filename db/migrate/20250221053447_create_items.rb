class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, index: true
      t.integer :ilvl
      t.integer :weight

      t.timestamps
    end
  end
end
