class Node < FrozenRecord::Base
  include ActiveModel::Conversion

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

    def quantity_for(seed)
      bytes = Digest::SHA256.digest seed
      seed_int = bytes.bytes.inject { |a, b| (a << 8) + b }
      Random.new(seed_int).rand(minimum_quantity..maximum_quantity)
    end
  end

  attribute :drops, Drop

  def recipes
    (attributes["recipes"] || []).map { |recipe_id| Recipe.find(recipe_id) }
  end
end
