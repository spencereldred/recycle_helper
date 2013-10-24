class RecyclersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_recycler

  def new
    @user = current_user
    @recyclers = Profile.where(user_id: @user[:id])
    @transaction = Transaction.new
    @all_trans = Transaction.where("recycler_user_id = #{@user[:id]} AND completion_date IS NULL")
  end

  def create
    transaction = Transaction.create(params[:transaction])
    if transaction.errors.empty?
      redirect_to recycler_path(transaction)
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
    redirect_to recycler_path(transaction)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def destroy
    User.delete(params[:user_id])
    redirect_to new_recycler_path
  end

end
