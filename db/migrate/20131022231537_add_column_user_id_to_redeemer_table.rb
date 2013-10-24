class AddColumnUserIdToRedeemerTable < ActiveRecord::Migration
  def change
    add_column :redeemers, :user_id, :string
  end
end
