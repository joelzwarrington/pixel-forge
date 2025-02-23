class Character < ApplicationRecord
  has_many :inventory_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }, format: { with: /\A[a-zA-Z\d]+\z/, message: "only allows letters and numbers" }

  def inventory
    Inventory.new(self)
  end
end
