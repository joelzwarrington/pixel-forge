class NodeLootPoolItem < ApplicationRecord
  belongs_to :node_loot_pool
  belongs_to :item

  validates :item, uniqueness: { scope: :node_loot_pool }
end
