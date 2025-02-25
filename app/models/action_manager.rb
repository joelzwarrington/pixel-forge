class ActionManager < ApplicationRecord
  class << self
    def active_for(character)
      character.actions.find_by(stopped_at: nil)
    end

    def begin(character, node)
      Action.transaction do
        self.end(character)
        time = Time.current

        character.actions.create(
          location_id: character.location_id,
          node_id: node.id,
          started_at: time,
          seed: "#{time.iso8601}-#{SecureRandom.hex}",
          next_tick_at: time + 5.seconds,
        )
      end
    end

    def end(character)
      if (action = active_for(character)).present?
        time = Time.current
        # executes ticks until stopped_at
        action.update!(stopped_at: time)
      end
    end

    def tick(action)
      time = Time.current
      last_tick_at = action.last_tick_at
      time_since_last_tick = time - last_tick_at
      seconds_per_tick = 1
      ticks = (time_since_last_tick / seconds_per_tick).floor

      drops = Hash.new(0)

      ticks.times.each do |tick_count|
        tick_at = last_tick_at.advance(seconds: seconds_per_tick * tick_count)

        action.node.drops.each do |drop|
          drops[drop.item.id] += random("#{action.seed}-#{tick_at.iso8601}").rand(drop.minimum_quantity..drop.maximum_quantity)
        end
      end

      new_last_tick_at = last_tick_at.advance(seconds: seconds_per_tick * ticks)
      action.update!(
        last_tick_at: new_last_tick_at,
        next_tick_at: new_last_tick_at.advance(seconds: seconds_per_tick)
      )

      drops
    end

    def random(seed)
      bytes = Digest::SHA256.digest seed
      seed_int = bytes.bytes.inject { |a, b| (a << 8) + b }
      Random.new(seed_int)
    end
  end
end
