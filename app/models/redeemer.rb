class Redeemer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :dmv_number, :user_id

  has_many :recycler_redeemers
  has_many :recyclers, through: :recycler_redeemers

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :email, presence: :true
  validates :phone, presence: :true
  validates :dmv_number, presence: :true

end
