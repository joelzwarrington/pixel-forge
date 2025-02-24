class Node < FrozenRecord::Base
  class Drop
    def self.load(data)
      data.map do |drop|
        new(drop)
      end
    end

    attr_reader :item, :minimum_quantity, :maximum_quantity

    def initialize(data)
      @item = Item.find(data["item_id"])
      @minimum_quantity = data["minimum_quantity"]
      @maximum_quantity = data["maximum_quantity"]
    end
  end

  attribute :drops, Drop
end
