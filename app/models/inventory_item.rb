class InventoryItem < ApplicationRecord
  belongs_to :character

  validates :item_id, uniqueness: { scope: :character }
  validates :quantity, numericality: { greater_than: 0 }

  def item
    Item.find(item_id)
  end
end
