class CreateCollectorRecyclers < ActiveRecord::Migration
  def change
    create_table :collector_recyclers do |t|
      t.references  :collector
      t.references  :recycler
      t.string         :glass
      t.string         :cans
      t.string         :bottles
      t.string         :other
      t.datetime    :selection_date
      t.datetime    :completion_date
      t.integer       :rating

      t.timestamps
    end
  end
end
