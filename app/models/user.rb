class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :function, :password, :password_confirmation,
                          :first_name, :last_name, :address, :city, :state, :zipcode, :dmv_number, :phone,
                          :latitude, :longitude

  before_save :create_remember_token

  validates :username, presence: true, uniqueness: true
  validates :function, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  after_create :send_welcome_email

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

    def send_welcome_email
        # automail welcome message to new user
        Hi5Mailer.welcome_user(self).deliver
    end

end
