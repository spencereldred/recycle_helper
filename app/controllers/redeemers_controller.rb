class RedeemersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_redeemer

  def index
    @user = current_user
    @available = Transaction.where(selection_date: nil)
    @selected = Transaction.where("redeemer_user_id = #{@user[:id]}  AND completion_date IS NULL")
    @recyclers = Profile.where(function: 'recycler')
    #@redeemers = Profile.all
    @redeemer = Profile.where("user_id = #{@user[:id]}")
  end

  # def new
  #   @redeemer = Redeemer.new
  # end

  # def create
  #   redeemer = Redeemer.create(params[:redeemer])
  #   if redeemer.errors.empty?
  #     redirect_to redeemer_path(redeemer)
  #   else
  #     flash[:errors] = redeemer.errors.full_messages
  #     @redeemer = Redeemer.new
  #     render :new
  #   end
  # end

  # def edit
  #   @redeemer = Redeemer.find(params[:id])
  # end

  # def update
  #   redeemer = Redeemer.find(params[:id])
  #   redeemer.update_attributes(params[:redeemer])
  #   redirect_to redeemer_path(redeemer)
  # end

  # def show
  #   @redeemer = Redeemer.find(params[:id])
  # end

  # def history
  #   @redeemer = Redeemer.find(params[:id])
  #   @recyclers_for_redeemer = RecyclerRedeemer.where( "redeemer_id = ?", params[:id] )
  # end


  # def destroy
  #   Redeemer.delete(params[:id])
  #   redirect_to redeemers_path
  # end

end
