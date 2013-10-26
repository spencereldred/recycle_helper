class TransactionsController < ApplicationController
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
      redirect_to new_transaction_path
    else
      flash[:errors] = transaction.errors.full_messages
      @transaction = Transaction.new
      render :new
    end
  end

end
