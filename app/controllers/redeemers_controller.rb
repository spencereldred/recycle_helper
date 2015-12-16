  class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer


  def index
    trans = Transaction.where(group_id: current_user.group_id)
                         .near([current_user.latitude, current_user.longitude], current_user.radius)
    trans += Transaction.where(group_id: "2")
                         .near([current_user.latitude, current_user.longitude], current_user.radius)
    trans.uniq!
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

  def update
    # Update is triggered by the "select" and "unselect" checkboxes and
    # by the complete button on the Redeemers index page
    trans = Transaction.find(params[:id])
    if (params[:selected] == true && trans.selected == false)
      redeemer = {selected: params[:selected],
                selection_date: params[:selection_date],
                redeemer_user_id: params[:redeemer_user_id]}
      trans.update_attributes(redeemer)
    elsif ((params[:selected] == true && trans.selected == true &&
          params[:completed] == true && trans.completed == false))
      redeemer = {completed: params[:completed],
                completion_date: params[:completion_date]}
      trans.update_attributes(redeemer)
    end


    if trans.errors.empty?
      TransactionUpdateEmailWorker.perform_async(trans.id)
      TransactionUpdateTextWorker.perform_async(trans.id)
    end

    respond_to do |format|
      format.json {render :json => trans}
      format.html
    end
  end

end




