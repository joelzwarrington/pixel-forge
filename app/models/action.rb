class Action < ApplicationRecord
  broadcasts
  belongs_to :character, default: -> { Current.character }
  scope :active, -> { where(stopped_at: nil) }
  scope :to_be_ticked, ->(time = Time.current) { joins(:character).active.where(next_tick_at: ..time, character: { online: true }) }

  validates :location_id, :node_id, presence: true

  before_create :stop_active_actions
  before_create :set_next_tick_at

  attribute :drops, :json, default: {}
  attribute :started_at, :datetime, default: -> { Time.current }

  def location
    Location.find(location_id)
  end

  def node
    Node.find(node_id)
  end

  def recipe
    Recipe.find(recipe_id) if recipe_id.present?
  end

  def recipe?
    recipe.present?
  end

  def drops
    (attributes["drops"] || {}).map do |item_id, quantity|
      [ Item.find(item_id), quantity ]
    end.sort_by(&:second)
  end

  def seconds_per_tick
    1
  end

  def tick
    attributes["drops"].default = 0

    transaction do
      while tickable?
        self.last_tick_at = (last_tick_at || started_at).advance(seconds: seconds_per_tick)

        if recipe?
          stop! unless character.inventory.remove(recipe.materials)
          recipe.items.each { |item, quantity| attributes["drops"][item.id] += quantity }
        else
          node.drops.each { |drop| attributes["drops"][drop.item.id] += drop.quantity_for("#{seed}-#{last_tick_at.iso8601}") }
        end
      end

      save!
    end
  end

  def tickable?(time = Time.current)
    time - (last_tick_at || started_at) >= seconds_per_tick
  end

  def active?
    stopped_at.nil?
  end

  def stopped?
    stopped_at&.past?
  end

  def stop!(time = Time.current)
    transaction do
      tick if tickable?(time)
      update!(
        stopped_at: time,
        next_tick_at: nil
      )
      character.inventory.add(drops)
    end
  end

  private

  def stop_active_actions
    character.actions.active.excluding(self).each(&:stop!)
  end

  def set_next_tick_at
    self.next_tick_at = started_at.advance(seconds: seconds_per_tick) if next_tick_at.blank?
  end
end
