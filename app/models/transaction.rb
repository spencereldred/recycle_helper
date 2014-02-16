class Transaction < ActiveRecord::Base
  attr_accessible :recycler_user_id, :redeemer_user_id,
                        :plastic, :glass, :cans, :other,
                        :selection_date, :completion_date, :rating,
                        :address, :city, :state, :zipcode,
                        :latitude, :longitude, :selected, :completed

  # belongs_to :user, :class_name=> 'User', :foriegn_key => 'recycler_user_id'
  # belongs_to :user, :class_name=> 'User', :foriegn_key => 'redeemer_user_id'

  validates :recycler_user_id, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  geocoded_by :full_address
  after_validation :geocode

  after_update :send_update_email

  after_create :send_job_available_email

  # scope :not_selected, where(selection_date: nil)

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

  private

    def send_job_available_email
      max_radius = 20 # set the notification radius
      user = User.find(recycler_user_id)
      nearby_redeemers = User.near([user.latitude, user.longitude], max_radius).where(function: "redeemer")
    #   nearby_redeemers = []

    #   redeemers_within_max_radius.each do |near_redeemer|
    #     near = User.near([user.latitude, user.longitude], near_redeemer.radius).where(function: "redeemer")
    #     if near
    #       nearby_redeemers << near
    #     end
    #   end

      binding.pry

      nearby_redeemers.each do |nearby_redeemer|
        ############ Transaction Created ##############
        # send all redeemers within their radius an alert that a job has been posted
        Hi5Mailer.job_available(nearby_redeemer).deliver
        # send text message alert
        message = "Shaka! #{nearby_redeemer.first_name}, a recycle job has just been posted in your area.
        Questions, contact Annie at hi5exchange@gmail.com."
        send_text(message, nearby_redeemer.phone ) if !nearby_redeemer.phone.empty?
      end
    end

    def send_update_email
        user = User.find(recycler_user_id)
        puts "#{user.first_name} - Email"
        if self.completed == true && self.selected == true
          ############ COMPLETED ##############
          # send recycler email that the redeemer indicates the job is done
          Hi5Mailer.completed(user).deliver
          # send recycler a text message
          message = "Shaka! #{user.first_name}, our records indicate your recycling has been picked up.
          If this is not true, please contact Annie at hi5exchange@gmail.com."
          # binding.pry
          send_text(message, user.phone ) if !user.phone.empty?
        elsif self.completed == false && self.selected == true
          ############ SELECTED ##############
          # send recycler an email that states a redeemer has claimed the job
          Hi5Mailer.selected(user).deliver
          # send recycler a text message
          message = "Shaka! #{user.first_name}, a redeemer will swing by within 24 hours, so please make sure your items are already out for pickup.
-Annie at hi5exchange@gmail.com"

          send_text(message, user.phone) if !user.phone.empty?
        else
          ############ UNSELECTED ##############
          # send recycler an email that states a redeemer has unclaimed the job
          # Hi5Mailer.unselected(user).deliver
          # send text message
          # message = "Aloha #{user.first_name}, the redeemer has unclaimed your job. Your job will go back in the queue."
          # send_text(message, user.phone) if !user.phone.empty?
        end

    end

    # Sends text message using Twilio's service
    def send_text(text, phone)
      account_sid    = ENV["ACCOUNT_SID"]
      auth_token     = ENV["AUTH_TOKEN"]
      client = Twilio::REST::Client.new account_sid, auth_token

      account = client.account
      message = account.sms.messages.create({
        :from => ENV["PHONE"],
        :to => phone,
        :body => text})
      puts message
    end


end
