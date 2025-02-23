class NodeLootPool < ApplicationRecord
  belongs_to :node
  has_many :node_loot_pool_items, dependent: :destroy

  validates :weight, presence: true, numericality: { greater_than: 0 }
end
