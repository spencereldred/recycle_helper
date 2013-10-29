class AddGeocodeToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :latitude, :float
    add_column :transactions, :longitude, :float
    add_column :transactions, :address, :string
    add_column :transactions, :city, :string
    add_column :transactions, :state, :string
    add_column :transactions, :zipcode, :string
  end
end
