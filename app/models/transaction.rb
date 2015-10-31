class Transaction < ActiveRecord::Base
  belongs_to :group
  attr_accessible :recycler_user_id, :redeemer_user_id,
                        :plastic, :glass, :cans, :other,
                        :selection_date, :completion_date, :rating,
                        :address, :city, :state, :zipcode,
                        :latitude, :longitude, :selected, :completed,
                        :non_hi5_plastic, :non_hi5_glass, :non_hi5_cans,
                        :magazines, :newspaper, :paper, :trans_type,
                        :group_id

  validates :recycler_user_id, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

end
