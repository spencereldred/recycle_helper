class User < ActiveRecord::Base
  has_secure_password
  has_one :profile, dependent: :destroy
  attr_accessible :username, :email, :function, :password, :password_confirmation

  before_save :create_remember_token

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :function, presence: true
  # validates :password, presence: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
