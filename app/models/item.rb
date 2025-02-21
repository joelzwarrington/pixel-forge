class Item < ApplicationRecord
  validates :name, presence: true
  validates :ilvl, :weight, numericality: { greater_than_or_equal_to: 0 }
end
