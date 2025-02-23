class Action < ApplicationRecord
  belongs_to :location_node
  has_one :location, through: :location_node
  has_one :node, through: :location_node
  belongs_to :character

  # do calculation of drops, then update next tick dates
  def tick
  end

  # the calculated drops
  def drops
  end
end
