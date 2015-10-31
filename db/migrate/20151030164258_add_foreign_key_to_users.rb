class AddForeignKeyToUsers < ActiveRecord::Migration
  def change
    def up
      add_column :users, :group_id, :integer
    end

    def down
      remove_column :users, :group_id, :integer
    end
  end
end
