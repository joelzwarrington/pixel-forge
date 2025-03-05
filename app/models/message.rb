class Message < ApplicationRecord
  belongs_to :character, default: -> { Current.character }

  before_validation :set_location
  validates :location_id, presence: true, inclusion: { in: Location.pluck(:id) }

  broadcasts_to ->(message) { [ message.location, :messages ] }

  def location
    Location.find(location_id)
  end

  private

  def set_location
    self.location_id = character.location_id
  end
end
