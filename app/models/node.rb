class Node < ApplicationRecord
  has_many :location_nodes, dependent: :destroy
  has_many :locations, through: :location_nodes

  validates :name, presence: true
end
