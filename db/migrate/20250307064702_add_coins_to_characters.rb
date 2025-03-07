class AddCoinsToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_column :characters, :coins, :integer
  end
end
