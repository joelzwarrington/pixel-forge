class ActionManager < ApplicationRecord
  class << self
    def active_for(character)
      character.actions.find_by(stopped_at: nil)
    end

    def begin(character, node, recipe = nil)
      Action.transaction do
        self.end(character)
        time = Time.current

        character.actions.create(
          location_id: character.location_id,
          node_id: node.id,
          recipe_id: recipe&.id,
          started_at: time,
          seed: "#{time.iso8601}-#{SecureRandom.hex}",
          next_tick_at: time + 1.second,
        )
      end
    end

    def end(character)
      if (action = active_for(character)).present?
        time = Time.current
        # executes ticks until stopped_at
        Action.transaction do
          tick(action, time)
          action.update!(stopped_at: time, next_tick_at: nil)
          character.inventory.add(action.drops)
        end
      end
    end

    def tick(action, time = Time.current)
      last_tick_at = action.last_tick_at || action.started_at
      time_since_last_tick = time - last_tick_at
      seconds_per_tick = 1
      ticks = (time_since_last_tick / seconds_per_tick).floor

      drops = Hash.new(0)

      ticks.times.each do |tick_count|
        tick_at = last_tick_at.advance(seconds: seconds_per_tick * tick_count)


        if recipe = action.recipe
          begin
            action.character.inventory.remove(recipe.materials)
          rescue
            new_last_tick_at = last_tick_at.advance(seconds: seconds_per_tick * tick_count)
            action.update!(
              last_tick_at: new_last_tick_at,
              next_tick_at: nil,
              drops: drops.merge(action.attributes["drops"] || {}) { |key, new_value, old_value| new_value + old_value }
            )
            action.character.inventory.add(action.drops)
          end
          action.recipe.items.each do |item, quantity|
            drops[item.id] += quantity
          end
        else
          action.node.drops.each do |drop|
            drops[drop.item.id] += random("#{action.seed}-#{tick_at.iso8601}").rand(drop.minimum_quantity..drop.maximum_quantity)
          end
        end
      end

      new_last_tick_at = last_tick_at.advance(seconds: seconds_per_tick * ticks)
      action.update!(
        last_tick_at: new_last_tick_at,
        next_tick_at: new_last_tick_at.advance(seconds: seconds_per_tick),
        drops: drops.merge(action.attributes["drops"] || {}) { |key, new_value, old_value| new_value + old_value }
      )
    end

    def random(seed)
      bytes = Digest::SHA256.digest seed
      seed_int = bytes.bytes.inject { |a, b| (a << 8) + b }
      Random.new(seed_int)
    end
  end
end
