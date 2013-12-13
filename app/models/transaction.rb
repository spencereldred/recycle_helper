class Transaction < ActiveRecord::Base
  attr_accessible :recycler_user_id, :redeemer_user_id,
                        :plastic, :glass, :cans, :other,
                        :selection_date, :completion_date, :rating,
                        :address, :city, :state, :zipcode,
                        :latitude, :longitude, :selected, :completed

  # belongs_to :user, :class_name=> 'User', :foriegn_key => 'recycler_user_id'
  # belongs_to :user, :class_name=> 'User', :foriegn_key => 'redeemer_user_id'

  validates :recycler_user_id, presence: true
  validates :plastic, presence: true
  validates :glass, presence: true
  validates :cans, presence: true
  validates :other, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  geocoded_by :full_address
  after_validation :geocode

  after_update :send_update_email

  # scope :not_selected, where(selection_date: nil)

  def full_address
     "#{self.address}, #{self.city} #{self.state} #{self.zipcode}"
  end

  private

    def send_update_email
        user = User.find(recycler_user_id)
        if self.completed == true && self.selected == true
          puts "%%%%%%%%%%%%%%%%%% completed: #{user.first_name}: #{user.email}"


          # send recycler email that the redeemer indicates the job is done
          Hi5Mailer.completed(user).deliver
        elsif self.completed == false && self.selected == true
          puts "%%%%%%%%%%%%%%%%%% selected: #{user.first_name}: #{user.email}"
          # send recycler an email that states a redeemer has claimed the job
          Hi5Mailer.selected(user).deliver
        else
          puts "%%%%%%%%%%%%%%%%%% unselected: #{user.first_name}: #{user.email}"
          # send recycler an email that states a redeemer has unclaimed the job
          Hi5Mailer.unselected(user).deliver
        end

    end


end
