class Recycler < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone, :addr_line_1, :addr_line_2, :city, :state, :zipcode

  has_many :collector_recyclers
  has_many :collectors, through: :collector_recyclers

  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validates :phone, presence: :true
  validates :email, presence: :true
  validates :addr_line_1, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zipcode, presence: :true
end
