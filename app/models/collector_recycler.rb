class CollectorRecycler < ActiveRecord::Base
  attr_accessible :collector, :recycler, :glass, :cans, :bottles, :other, :selection_date, :completion_date, :rating

  belongs_to :collector
  belongs_to :recycler

  validates :collector, presence: :true
  validates :recycler, presence: :true
  validates :glass, presence: :true
  validates :cans, presence: :true
  validates :bottles, presence: :true

end
