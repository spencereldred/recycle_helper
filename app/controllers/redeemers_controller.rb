class RedeemersController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @redeemers = Redeemer.all
  end

  def new
    @redeemer = Redeemer.new
  end

  def create
    redeemer = Redeemer.create(params[:redeemer])
    if redeemer.errors.empty?
      redirect_to redeemer_path(redeemer)
    else
      flash[:errors] = redeemer.errors.full_messages
      @redeemer = Redeemer.new
      render :new
    end
  end

  def edit
    @redeemer = Redeemer.find(params[:id])
  end

  def update
    redeemer = Redeemer.find(params[:id])
    redeemer.update_attributes(params[:redeemer])
    redirect_to redeemer_path(redeemer)
  end

  def show
    @redeemer = Redeemer.find(params[:id])
    @recyclers = Recycler.all
    @recyclers_for_redeemer = RecyclerRedeemer.where( "redeemer_id = ?", params[:id] )
  end

  def history
    @redeemer = Redeemer.find(params[:id])
    @recyclers = Recycler.all
    @recyclers_for_redeemer = RecyclerRedeemer.where( "redeemer_id = ?", params[:id] )
  end


  def destroy
    Redeemer.delete(params[:id])
    redirect_to redeemers_path
  end

end
