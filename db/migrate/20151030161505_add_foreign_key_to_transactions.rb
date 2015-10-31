class AddForeignKeyToTransactions < ActiveRecord::Migration
  def change
    def up
      add_column :transactions, :group_id, :integer
    end

    def down
      remove_column :transactions, :group_id, :integer
    end
  end
end
