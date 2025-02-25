class Action < ApplicationRecord
  belongs_to :character
  scope :active, -> { where(stopped_at: nil) }

  def location
    Location.find(location_id)
  end

  def node
    Node.find(node_id)
  end
end
