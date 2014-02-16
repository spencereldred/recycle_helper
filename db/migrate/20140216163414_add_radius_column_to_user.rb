class AddRadiusColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :radius, :integer, default: 10
  end

  def down
    remove_column :users, :radius, :integer
  end
end
