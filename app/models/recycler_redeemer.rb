class RecyclerRedeemer < ActiveRecord::Base
  attr_accessible :recycler_id, :redeemer_id, :plastic, :glass, :cans, :other, :selection_date, :completion_date, :rating

  belongs_to :recyclers
  belongs_to :redeemers

  validates :recycler_id, presence: :true
  validates :redeemer_id, presence: :true
  validates :plastic, presence: :true
  validates :glass, presence: :true
  validates :cans, presence: :true

end
