class Group < ActiveRecord::Base
  has_many :users
  has_many :transactions

  attr_accessible :description, :name, :url, :promo_code

end
