  class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer


  def index
    # returns transactions in a 20 mile radius to Redeemers index page
    # puts "@@@@@@@@@@@@@@@@@??????????!!!!!!!!!!!!!!!! #{current_user.function}, #{current_user.radius}"
    trans = Transaction.near([current_user.latitude, current_user.longitude], current_user.radius)
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

  def update
    # Update is triggered by the "select" and "unselect" checkboxes and
    # by the complete button on the Redeemers index page
    trans = Transaction.find(params[:id])
    # only update selected if it has not been selected already
    if ( (params[:selected] == true && trans.selected == false) ||
         (params[:selected] == true && trans.selected == true &&
          params[:completed] == true && trans.completed == false) )
      # puts "@@@@@@@@@@@@@@@@@@@ this is params[:selected]:  #{params[:selected]}  ; trans.selected:  #{trans.selected} @@@@@@@@@@@@@@@@@@@"
      # puts "@@@@@@@@@@@@@@@@@@@ this is params[:completed]: #{params[:completed]} ; trans.completed: #{trans.completed} @@@@@@@@@@@@@@@@@@@"
      redeemer = {selected: params[:selected],
                selection_date: params[:selection_date],
                redeemer_user_id: params[:redeemer_user_id],
                completed: params[:completed],
                completion_date: params[:completion_date]}
      trans.update_attributes(redeemer)
    end

    redeemer = {selected: params[:selected],
                selection_date: params[:selection_date],
                redeemer_user_id: params[:redeemer_user_id],
                completed: params[:completed],
                completion_date: params[:completion_date]}
    trans.update_attributes(redeemer)
    TransactionUpdateEmailWorker.perform_async(trans.id)
    TransactionUpdateTextWorker.perform_async(trans.id)
    respond_to do |format|
      format.json {render :json => trans}
      format.html
    end
  end

end




