class Location < FrozenRecord::Base
  include ActiveModel::Conversion

  def nodes
    Node.where(id: attributes["nodes"]).to_a
  end
end
