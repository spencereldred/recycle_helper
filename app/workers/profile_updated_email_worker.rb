class ProfileUpdatedEmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    Hi5Mailer.profile_updated(user).deliver
  end

end