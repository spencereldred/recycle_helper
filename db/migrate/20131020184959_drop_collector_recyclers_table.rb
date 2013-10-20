class DropCollectorRecyclersTable < ActiveRecord::Migration
  def up
    drop_table :collector_recyclers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
