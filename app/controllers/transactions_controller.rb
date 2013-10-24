class TransactionsController < ApplicationController
  before_filter :authorize
  before_filter :authorize_recycler


  def index
    @user = current_user
    @recyclers = Profile.where(user_id: @user[:id])
    @transactions = Transaction.all

  end

  def new
    @user = current_user
    @recyclers = Profile.where(user_id: @user[:id])
    @transaction = Transaction.new
  end

  def create
    transaction = Transaction.create(params[:transaction])
    if transaction.errors.empty?
      redirect_to transaction_path(transaction)
    else
      flash[:errors] = transaction.errors.full_messages
      @transaction = Transaction.new
      render :new
    end
  end

  def edit
    @user = current_user
    @transaction = Transaction.find(params[:id])
  end

  def update
    transaction = Transaction.find(params[:id])
    transaction.update_attributes(params[:transaction])
    redirect_to transaction_path(transaction)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    User.delete(params[:user_id])
    redirect_to transactions_path
  end

end
