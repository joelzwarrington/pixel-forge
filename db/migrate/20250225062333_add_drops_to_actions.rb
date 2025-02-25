class AddDropsToActions < ActiveRecord::Migration[8.0]
  def change
    add_column :actions, :drops, :json
  end
end
