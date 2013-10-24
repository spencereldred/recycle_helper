class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string         :recycler_user_id
      t.string         :redeemer_user_id
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
