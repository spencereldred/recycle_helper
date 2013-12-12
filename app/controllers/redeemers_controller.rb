class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer


  def index
    # returns transactions in a 20 mile radius
    puts params.inspect
    trans = Transaction.near([current_user.latitude, current_user.longitude], 20)
    puts trans.inspect
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

  def update
    # Update is triggered by the "select" and "unselect" buttons
    trans = Transaction.find(params[:id])
    redeemer = {selected: params[:selected],
                selection_date: params[:selection_date],
                redeemer_user_id: params[:redeemer_user_id],
                completed: params[:completed],
                completion_date: params[:completion_date]}
    # if checkbox == "completed"
    #   redeemer = {completed: params[:completed], completion_date: params[:completion_date]}
    # end
    # binding.pry
    trans.update_attributes(redeemer)
    respond_to do |format|
      format.json {render :json => trans}
      format.html
    end
  end

end
