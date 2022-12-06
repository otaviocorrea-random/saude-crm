class Municipes::Notifications::WelcomeWorker
  include Sidekiq::Worker
  queue_as :notifications

  def perform(municipe_id)
    municipe = Municipe.find(municipe_id)
    MunicipeMailer.welcome(municipe).deliver
  end
end