class Redeemer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :dmv_number

  has_many :collector_recyclers
  has_many :redeemers, through: :collector_recyclers

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true
  validates :phone, presence: :true
  validates :dmv_number, presence: :true

end
