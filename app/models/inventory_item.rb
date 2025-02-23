class InventoryItem < ApplicationRecord
  belongs_to :character
  belongs_to :item

  validates :quantity, numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_weight

  private

  def set_weight
    return if quantity.nil?

    self.weight = quantity * (item&.weight || 0)
  end
end
