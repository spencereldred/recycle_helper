class Transaction < ActiveRecord::Migration
  def up
    add_column :transactions, :cardboard, :boolean, default: false
    add_column :transactions, :non_hi5_plastic, :boolean, default: false
    add_column :transactions, :non_hi5_glass, :boolean, default: false
    add_column :transactions, :non_hi5_cans, :boolean, default: false
    add_column :transactions, :magazines, :boolean, default: false
    add_column :transactions, :newspaper, :boolean, default: false
    add_column :transactions, :paper, :boolean, default: false
    add_column :transactions, :trans_type, :string
  end

  def down
    remove_column :transactions, :cardboard
    remove_column :transactions, :non_hi5_plastic
    remove_column :transactions, :non_hi5_glass
    remove_column :transactions, :non_hi5_cans
    remove_column :transactions, :magazines
    remove_column :transactions, :newspaper
    remove_column :transactions, :paper
    remove_column :transactions, :trans_type
  end
end
