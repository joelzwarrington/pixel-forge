class Location < ApplicationRecord
  has_many :location_nodes, dependent: :destroy
  has_many :nodes, through: :location_nodes

  validates :name, presence: true
end
