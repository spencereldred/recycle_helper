class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :function, :password, :password_confirmation,
                          :first_name, :last_name, :address, :city, :state, :zipcode, :dmv_number, :phone,
                          :latitude, :longitude, :radius

  before_save :create_remember_token
  # before_save { self.email = email.downcase }

  validates :password, length: { minimum: 6 }, allow_nil: true

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :function, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :radius, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :email, presence: true
  # validates :phone, presence: true

  after_create :send_welcome_email
  after_update :send_profile_updated_email

  geocoded_by :full_address, :if => :full_address_changed?
  after_validation :geocode

  scope :recycler, where(function: "recycler")

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  private

    def send_profile_updated_email
      Hi5Mailer.profile_updated(self).deliver
      # send text message alert
      message = "Shaka! #{self.first_name}, your profile has been updated.
      Questions, contact Annie at hi5exchange@gmail.com."
      send_text(message, self.phone ) if !self.phone.empty?
    end

    def send_welcome_email
        # automail welcome message to new user
        if self.function == "redeemer"
          Hi5Mailer.welcome_redeemer(self).deliver
          message = "Shaka! #{self.first_name}, your redeemer account has been created.
          Questions, contact Annie at hi5exchange@gmail.com."
          send_text(message, self.phone ) if !self.phone.empty?
        else
          Hi5Mailer.welcome_recycler(self).deliver
          message = "Shaka! #{self.first_name}, your recycler account has been created.
          Questions, contact Annie at hi5exchange@gmail.com."
          send_text(message, self.phone ) if !self.phone.empty?
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
