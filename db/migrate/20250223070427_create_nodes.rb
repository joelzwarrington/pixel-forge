class CreateNodes < ActiveRecord::Migration[8.0]
  def change
    create_table :nodes do |t|
      t.string :name

      t.timestamps
    end
  end
end
