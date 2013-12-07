class TransactionsController < ApplicationController
  before_filter :authorize
  before_filter :authorize_recycler

  def index
    respond_to do |format|
      format.html
      format.json { render :json => Transaction.near([current_user.latitude, current_user.longitude], 20) }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render :json => Transaction.new }
    end
  end

  def create
    # binding.pry
    respond_to do |format|
      format.html
      format.json { render :json => Transaction.create(params[:transaction]) }
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
