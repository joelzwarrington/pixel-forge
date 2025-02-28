class TickActionJob < ApplicationJob
  queue_as :default

  def perform(action)
    action.tick
  end
end
