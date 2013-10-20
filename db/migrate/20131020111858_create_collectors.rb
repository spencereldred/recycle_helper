class CreateCollectors < ActiveRecord::Migration
  def change
    create_table :collectors do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :phone
      t.string    :email
      t.string    :drivers_license_number

      t.timestamps
    end
  end
end
