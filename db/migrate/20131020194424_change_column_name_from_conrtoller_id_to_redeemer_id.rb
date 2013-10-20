class ChangeColumnNameFromConrtollerIdToRedeemerId < ActiveRecord::Migration
  def up
    rename_column :recycler_redeemers, :collector_id, :redeemer_id
  end

  def down
  end
end
