class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer

  def index
    @user = current_user

    # Gather list of local recyclers within 20 miles of the redeemer.
    @local_recyclers = User.near([@user.latitude, @user.longitude], 20).where(function: "recycler")

    # Gather all "available" transactions that have not been selected yet (nil).
    @available = Transaction.near([@user.latitude, @user.longitude], 20).where(selection_date: nil)

    # Gather all "selected" transactions that  are assigned to the logged in user and have not been completed yet.
    # Once the transaction is marked completed by the "recycler", it will no longer show on the "redeemer" page.
    @selected = Transaction.where("redeemer_user_id = #{@user[:id]}  AND completion_date IS NULL")
  end

  def update
    # Update is triggered by the "select" and "unselect" buttons on the transaction#index page.
    transaction = Transaction.find(params[:id])
    if transaction.selection_date == nil
      # "select" button response.
      # If the transaction does not have a "selection_date", then set the date to now.
      transaction.update_attributes(selection_date: Time.now, redeemer_user_id: current_user.id)
    else
      # "unselect" button response.
      # If the transactio does have a "selection_date", then set it to nil.
      transaction.update_attributes(selection_date: nil, redeemer_user_id: nil)
    end
    redirect_to redeemers_path
  end

end
