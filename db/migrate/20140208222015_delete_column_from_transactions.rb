class DeleteColumnFromTransactions < ActiveRecord::Migration
  def up
    remove_column :transactions, :other
  end

  def down
    add_column :transactions, :other, :string
  end
end
