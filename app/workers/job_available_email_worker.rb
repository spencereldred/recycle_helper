class JobAvailableEmailWorker
  include Sidekiq::Worker

  def perform(recycler_user_id)
    max_radius = 8 # set the notification radius
    user = User.find(recycler_user_id)
    redeemers_within_max_radius = User.near([user.latitude, user.longitude], max_radius).where(function: "redeemer")

    redeemers_within_max_radius.each do |near_redeemer|
      if user.distance_from([near_redeemer.latitude, near_redeemer.longitude]) <= near_redeemer.radius
        ############ Transaction Created ##############
        # send all redeemers within their radius an alert that a job has been posted
        Hi5Mailer.job_available(near_redeemer).deliver
        puts "@@@@@@@@@@@@@@@@@@@@@@@@@@ distance #{near_redeemer.first_name} is : #{user.distance_from([near_redeemer.latitude, near_redeemer.longitude])}"
      end
    end
  end

end