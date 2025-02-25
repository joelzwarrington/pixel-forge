class Action < ApplicationRecord
  belongs_to :character
  scope :active, -> { where(stopped_at: nil) }

  before_create :start_ticks

  def location
    Location.find(location_id)
  end

  def node
    Node.find(node_id)
  end

  private

  def start_ticks
    self.started_at = Time.current
    self.seed = "#{started_at.iso8601}-#{SecureRandom.hex}"
    self.next_tick_at = started_at + 5.seconds
  end
end
