class Transaction < ActiveRecord::Base
  attr_accessible :recycler_user_id, :redeemer_user_id,
                        :plastic, :glass, :cans, :other,
                        :selection_date, :completion_date, :rating

 validates :recycler_user_id, presence: true
 validates :plastic, presence: true
 validates :glass, presence: true
 validates :cans, presence: true
 validates :other, presence: true

end
