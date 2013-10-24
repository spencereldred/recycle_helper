class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :phone
      t.string   :addr_line_1
      t.string   :addr_line_2
      t.string   :city
      t.string   :state
      t.string   :zipcode
      t.string   :dmv_number
      t.string   :user_id

      t.timestamps
    end
  end
end
