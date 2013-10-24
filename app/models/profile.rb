class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :phone,
                          :addr_line_1, :addr_line_2, :city, :state,
                          :zipcode, :dmv_number, :user_id, :function

  belongs_to :user

end
