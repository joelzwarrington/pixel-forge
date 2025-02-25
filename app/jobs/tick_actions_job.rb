class TickActionsJob < ApplicationJob
  queue_as :actions

  def perform
    jobs = Action.to_be_ticked.map { |action| TickActionJob.new(action) }
    ActiveJob.perform_all_later(jobs)
  end
end
