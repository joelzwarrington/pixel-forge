class Action < ApplicationRecord
  broadcasts
  belongs_to :character
  scope :active, -> { where(stopped_at: nil) }

  def location
    Location.find(location_id)
  end

  def node
    Node.find(node_id)
  end

  def drops
    (attributes["drops"] || {}).map do |item_id, quantity|
      [ Item.find(item_id), quantity ]
    end.sort_by(&:second)
  end
end
