class ActionManager < ApplicationRecord
  class << self
    def active_for(character)
      character.actions.find_by(stopped_at: nil)
    end

    def begin(character, node)
      character.actions.create(location_id: character.location_id, node_id: node.id)
    end

    def end(character)
    end
  end
end
