class TransactionsController < ApplicationController
  before_filter :authorize
  before_filter :authorize_recycler

  def index
    if current_user.function == 'super_admin'
      trans = Transaction.all
    else
      binding.pry
      trans = Transaction.where(group_id: current_user.group_id)
                         .near([current_user.latitude, current_user.longitude], current_user.radius)
      trans += Transaction.where(group_id: "2")
                         .near([current_user.latitude, current_user.longitude], current_user.radius)
      trans.uniq!
    end
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render :json => Transaction.new }
    end
  end

  def create
    trans = Transaction.create(params[:transaction])
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
    if trans.trans_type == "redeemable"
      JobAvailableEmailWorker.perform_async(trans.recycler_user_id)
      JobAvailableTextWorker.perform_async(trans.recycler_user_id)
    end
  end

  def update
    trans = Transaction.find(params[:id])
    recycler = {completed: params[:completed], completion_date: params[:completion_date]}
    trans.update_attributes(recycler)
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

end
