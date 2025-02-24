class NodeLootPoolItem < ApplicationRecord
  belongs_to :node_loot_pool

  validates :item_id, uniqueness: { scope: :node_loot_pool }

  def item
    Item.find(item_id)
  end
end
