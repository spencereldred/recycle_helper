class User < ActiveRecord::Base
  has_secure_password
  has_one :profile, dependent: :destroy
  attr_accessible :username, :email, :function, :password, :password_confirmation

  before_save :create_remember_token

  validates :username, presence: true, uniqueness: true
  validates :function, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
