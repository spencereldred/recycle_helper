class RecyclerRedeemersController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
     @recycler_redeemers = RecyclerRedeemer.all
  end

  def new
    @recycler_redeemer = RecyclerRedeemer.new
  end

  def create
    recycler_redeemer = RecyclerRedeemer.create(params[:recycler_redeemer])
    if recycler_redeemer.errors.empty?
      redirect_to recycler_redeemer_path(recycler_redeemer)
    else
      flash[:errors] = recycler_redeemer.errors.full_messages
      @recycler_redeemer = RecyclerRedeemer.new
      render :new
    end
  end

  def edit
    @recycler_redeemer = RecyclerRedeemer.find(params[:id])
  end

  def update
    recycler_redeemer = RecyclerRedeemer.find(params[:id])
    recycler_redeemer.update_attributes(params[:recycler_redeemer])
    redirect_to recycler_redeemer_path(recycler_redeemer)
  end

  def show
    @recycler_redeemer = RecyclerRedeemer.find(params[:id])
  end

  def destroy
    RecyclerRedeemer.delete(params[:id])
    redirect_to recycler_redeemers_path
  end

end
