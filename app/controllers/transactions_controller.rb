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
    @all_trans = Transaction.where("recycler_user_id = #{@user[:id]} AND completion_date IS NULL")
  end

  def create
    transaction = Transaction.create(params[:transaction])
    if transaction.errors.empty?
      redirect_to new_transaction_path
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
    if transaction.completion_date == nil && transaction.selection_date
      transaction.update_attributes(completion_date: Time.now)
    end
    redirect_to new_transaction_path

  end

  def show
    @recyclers = Profile.where(user_id: current_user[:id])
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    User.delete(params[:user_id])
    redirect_to transactions_path
  end

end
