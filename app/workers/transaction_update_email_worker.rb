class TransactionUpdateEmailWorker
  include Sidekiq::Worker

  def perform(trans_id)
      trans = Transaction.find(trans_id)
      user = User.find(trans.recycler_user_id)
      puts "#{user.first_name} - Email"

      if trans.completed == true && trans.selected == true
        ############ COMPLETED ##############
        # send recycler email that the redeemer indicates the job is done
        Hi5Mailer.completed(user).deliver

      end

      if trans.completed == false && trans.selected == true
        ############ SELECTED ##############
        # send recycler an email that states a redeemer has claimed the job
        Hi5Mailer.selected(user).deliver

      end
  end

end