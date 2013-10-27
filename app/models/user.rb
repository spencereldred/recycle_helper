class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :function, :password, :password_confirmation,
                          :first_name, :last_name, :address, :city, :state, :zipcode, :dmv_number, :phone,
                          :latitude, :longitude

  before_save :create_remember_token

  validates :username, presence: true, uniqueness: true
  validates :function, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    :zipcode
     # "#{:address}, #{:city} #{:state} #{:zipcode}"
  end

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
