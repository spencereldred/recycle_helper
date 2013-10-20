class Collector < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :phone, :email, :drivers_license_number

  has_many :collector_recyclers
  has_many :recyclers, through: :collector_recyclers

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :phone, presence: :true
  validates :email, presence: :true
  validates :drivers_license_number, presence: :true

end
