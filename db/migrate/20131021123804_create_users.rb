class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :function
      t.string :password_digest
      t.string :remember_token
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :dmv_number
      t.float   :latitude
      t.float   :longitude

      t.timestamps
    end
  end
end
