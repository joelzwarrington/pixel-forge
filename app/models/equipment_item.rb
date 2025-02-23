class EquipmentItem < ApplicationRecord
  belongs_to :character
  belongs_to :item

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

  validates :slot, presence: true, uniqueness: { scope: :character }, inclusion: { in: SLOTS, message: "%{value} is not a valid slot" }
end
