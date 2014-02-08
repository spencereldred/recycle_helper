class AddColumnToTransactions < ActiveRecord::Migration
  def up
    add_column :transactions, :other, :integer
  end

  def down
    remove_column :transactions, :other
  end
end
