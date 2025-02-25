class TickActionJob < ApplicationJob
  queue_as :default

  def perform(action)
    ActionManager.tick action
  end
end
