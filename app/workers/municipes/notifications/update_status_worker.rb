class Municipes::Notifications::UpdateStatusWorker
  include Sidekiq::Worker
  queue_as :notifications

  def perform(municipe_id)
    municipe = Municipe.find(municipe_id)
    MunicipeMailer.update_status(municipe).deliver
  end
end