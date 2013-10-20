class CreateRedeemers < ActiveRecord::Migration
  def change
    create_table :redeemers do |t|
      t.string     :first_name
      t.string     :last_name
      t.string     :email
      t.string     :phone
      t.string     :dmv_number

      t.timestamps
    end
  end
end
