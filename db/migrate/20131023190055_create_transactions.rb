class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer       :recycler_user_id
      t.integer       :redeemer_user_id
      t.string         :plastic
      t.string         :glass
      t.string         :cans
      t.string         :other
      t.datetime    :selection_date
      t.datetime    :completion_date
      t.integer       :rating
      t.float           :latitude
      t.float           :longitude
      t.string         :address
      t.string         :city
      t.string         :state
      t.string         :zipcode
      t.boolean        :selected
      t.boolean        :completed


      t.timestamps
    end
  end
end
