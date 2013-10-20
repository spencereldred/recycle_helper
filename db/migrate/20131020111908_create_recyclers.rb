class CreateRecyclers < ActiveRecord::Migration
  def change
    create_table :recyclers do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :phone
      t.string   :addr_line_1
      t.string   :addr_line_2
      t.string   :city
      t.string   :state
      t.string   :zipcode

      t.timestamps
    end
  end
end
