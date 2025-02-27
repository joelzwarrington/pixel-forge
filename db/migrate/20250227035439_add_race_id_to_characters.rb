class AddRaceIdToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :race_id, :string
  end
end
