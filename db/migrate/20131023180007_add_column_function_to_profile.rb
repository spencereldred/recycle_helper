class AddColumnFunctionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :function, :string
  end
end
