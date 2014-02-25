class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer


  def index
    # returns transactions in a 20 mile radius to Redeemers index page
    puts params.inspect
    trans = Transaction.near([current_user.latitude, current_user.longitude], 20)
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

  def update
    # Update is triggered by the "select" and "unselect" checkboxes and
    # by the complete button on the Redeemers index page
    trans = Transaction.find(params[:id])
    puts "@@@@@@@@@@ this is trans: #{trans}"
    redeemer = {selected: params[:selected],
                selection_date: params[:selection_date],
                redeemer_user_id: params[:redeemer_user_id],
                completed: params[:completed],
                completion_date: params[:completion_date]}
    trans.update_attributes(redeemer)
    TransactionUpdateEmailTextWorker.perform_async(trans.id)
    respond_to do |format|
      format.json {render :json => trans}
      format.html
    end
  end

end




