class Character < ApplicationRecord
  has_many :inventory_items, dependent: :destroy
  has_many :equipment_items, dependent: :destroy
  has_many :actions, dependent: :destroy
  has_one :guild_character, dependent: :destroy
  has_one :guild, through: :guild_character

  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }, format: { with: /\A[a-zA-Z\d]+\z/, message: "only allows letters and numbers" }

  before_create :set_starting_location

  def inventory
    Inventory.new(self)
  end

  delegate :equipped?, to: :equipment

  def equipment
    Equipment.new(self)
  end

  def location
    Location.find(location_id) if location_id.present?
  end

  def race
    Race.find(race_id) if race_id.present?
  end

  private

  def set_starting_location
    self.location_id = race.starting_location_id
  end
end
