class AddPromoCodeToGroups < ActiveRecord::Migration
  def change
    def up
      add_column :groups, :promo_code, :string
    end

    def down
      remove_column :groups, :promo_code, :string
    end
  end
end
