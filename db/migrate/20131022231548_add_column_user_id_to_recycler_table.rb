class AddColumnUserIdToRecyclerTable < ActiveRecord::Migration
  def change
    add_column :recyclers, :user_id, :string
  end
end
