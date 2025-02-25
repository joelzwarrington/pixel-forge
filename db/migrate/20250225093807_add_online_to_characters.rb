class AddOnlineToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :online, :boolean
  end
end
