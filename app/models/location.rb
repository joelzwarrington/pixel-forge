class Location < FrozenRecord::Base
  def nodes
    Node.where(id: attributes["nodes"]).to_a
  end
end
