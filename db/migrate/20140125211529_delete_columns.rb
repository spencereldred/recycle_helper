class DeleteColumns < ActiveRecord::Migration
  def up
    remove_column :transactions, :plastic
    remove_column :transactions, :cans
    remove_column :transactions, :glass
  end

  def down
    add_column :transactions, :plastic, :string
    add_column :transactions, :cans, :string
    add_column :transactions, :glass, :string
  end
end
