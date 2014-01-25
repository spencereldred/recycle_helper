class AddColumns < ActiveRecord::Migration
  def up
    add_column :transactions, :plastic, :integer
    add_column :transactions, :cans, :integer
    add_column :transactions, :glass, :integer
  end

  def down
    remove_column :transactions, :plastic
    remove_column :transactions, :cans
    remove_column :transactions, :glass
  end
end
