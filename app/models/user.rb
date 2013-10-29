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
  validates :email, presence: true
  validates :phone, presence: true

  geocoded_by :full_address, :if => :full_address_changed?
  after_validation :geocode

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
