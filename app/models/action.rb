class Action < ApplicationRecord
  belongs_to :location_node
  has_one :location, through: :location_node
  has_one :node, through: :location_node
  belongs_to :character
end
