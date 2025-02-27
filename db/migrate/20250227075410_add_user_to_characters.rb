class AddUserToCharacters < ActiveRecord::Migration[8.0]
  def change
    add_reference :characters, :user, null: false, foreign_key: true
  end
end
