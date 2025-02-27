class AddRecipeIdToAction < ActiveRecord::Migration[8.0]
  def change
    add_column :actions, :recipe_id, :string
    add_index :actions, :recipe_id
  end
end
