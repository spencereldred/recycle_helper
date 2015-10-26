class WelcomeEmailRedeemerWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    Hi5Mailer.welcome_redeemer(user).deliver
  end

end