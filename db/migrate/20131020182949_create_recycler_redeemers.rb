class CreateRecyclerRedeemers < ActiveRecord::Migration
  def change
    create_table :recycler_redeemers do |t|
      t.references  :collector
      t.references  :recycler
      t.string         :plastic
      t.string         :glass
      t.string         :cans
      t.string         :other
      t.datetime    :selection_date
      t.datetime    :completion_date
      t.integer       :rating

      t.timestamps
    end
  end
end
