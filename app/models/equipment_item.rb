class EquipmentItem < ApplicationRecord
  belongs_to :character

  SLOTS = %w[
    head
    shoulders
    chest
    wrist
    hands
    waist
    legs
    feet
    neck
    back
    finger_one
    finger_two
    main_hand
    off_hand
  ]

  validates :item_id, equipment_slot: true, uniqueness: { scope: [ :character, :slot ] }
  validates :slot, presence: true, uniqueness: { scope: :character }, inclusion: { in: SLOTS, message: "%{value} is not a valid slot" }

  def item
    Item.find(item_id)
  end
end
