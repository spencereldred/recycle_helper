class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer

  def index
    @user = current_user
    @available = Transaction.where(selection_date: nil)
    @selected = Transaction.where("redeemer_user_id = #{@user[:id]}  AND completion_date IS NULL")
    @recyclers = Profile.where(function: 'recycler')
    @redeemer = Profile.where("user_id = #{@user[:id]}")
  end

  def update
    # binding.pry
    transaction = Transaction.find(params[:id])
    if transaction.selection_date == nil
      transaction.update_attributes(selection_date: Time.now, redeemer_user_id: current_user.id)
    else
      transaction.update_attributes(selection_date: nil, redeemer_user_id: nil)
    end
    redirect_to redeemers_path
  end

end
