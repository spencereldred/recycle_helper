class DeleteDmvColumnFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :dmv_number
  end

  def down
    add_column :users, :dmv_number, :string
  end
end
