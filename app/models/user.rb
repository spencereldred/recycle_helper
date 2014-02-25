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
  # validates :phone, presence: true - (if phone nil => no text messages)

  geocoded_by :full_address, :if => :full_address_changed?
  after_validation :geocode

  scope :recycler, where(function: "recycler")

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
