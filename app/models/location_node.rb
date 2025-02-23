class LocationNode < ApplicationRecord
  belongs_to :location
  belongs_to :node
  has_many :actions, dependent: :nullify
end
