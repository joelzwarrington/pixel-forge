class Item < ApplicationRecord
  has_many :inventory_items, dependent: :destroy

  validates :name, presence: true
  validates :ilvl, :weight, numericality: { greater_than_or_equal_to: 0 }
end
