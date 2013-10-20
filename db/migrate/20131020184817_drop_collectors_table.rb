class DropCollectorsTable < ActiveRecord::Migration
  def up
    drop_table :collectors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
