class TransactionsController < ApplicationController
  before_filter :authorize
  before_filter :authorize_recycler

  def new
    @user = current_user
    # @recyclers = User.where(id: @user[:id])
    @transaction = Transaction.new
    # Show Recycler all transactions that match his/her id and that have not been completed
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

  def update
    transaction = Transaction.find(params[:id])
    if transaction[:selection_date] != nil
      # When the "completed" button is clicked set the completion date to "now",
      # as long as that transaction was previously selected.
      transaction.update_attributes(completion_date: Time.now)
    end
    redirect_to new_transaction_path
  end

end
