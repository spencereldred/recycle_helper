class Transaction < ActiveRecord::Migration
  def up
    add_column :transactions, :cardboard, :boolean, default: false
    add_column :transactions, :non_hi5_plastic, :boolean, default: false
    add_column :transactions, :non_hi5_glass, :boolean, default: false
    add_column :transactions, :non_hi5_cans, :boolean, default: false
    add_column :transactions, :magazines, :boolean, default: false
    add_column :transactions, :newspaper, :boolean, default: false
    add_column :transactions, :paper, :boolean, default: false
  end

  def down
    remove_column :transactions, :cardboard, :boolean
    remove_column :transactions, :non_hi5_plastic, :boolean
    remove_column :transactions, :non_hi5_glass, :boolean
    remove_column :transactions, :non_hi5_cans, :boolean
    remove_column :transactions, :magazines, :boolean
    remove_column :transactions, :newspaper, :boolean
    remove_column :transactions, :paper, :boolean
  end
end
