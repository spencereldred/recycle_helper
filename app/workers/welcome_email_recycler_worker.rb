class WelcomeEmailRecyclerWorker
  include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # recurrence {hourly}
  def perform(user_id)
    user = User.find(user_id)
    Hi5Mailer.welcome_recycler(user).deliver
  end

end