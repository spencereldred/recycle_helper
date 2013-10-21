class RecyclersController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
    @recyclers = Recycler.all
  end

  def new
    @recycler = Recycler.new
  end

  def create
    recycler = Recycler.create(params[:recycler])
    if recycler.errors.empty?
      redirect_to recycler_path(recycler)
    else
      flash[:errors] = recycler.errors.full_messages
      @recycler = Recycler.new
      render :new
    end
  end

  def edit
    @recycler = Recycler.find(params[:id])
  end

  def update
    recycler = Recycler.find(params[:id])
    recycler.update_attributes(params[:recycler])
    redirect_to recycler_path(recycler)
  end

  def show
    @recycler = Recycler.find(params[:id])
    @redeemers = Redeemer.all
    @redeemers_for_recycler = RecyclerRedeemer.where( "recycler_id = ?", params[:id] )
  end

  def history
    @recycler = Recycler.find(params[:id])
    @redeemers = Redeemer.all
    @redeemers_for_recycler = RecyclerRedeemer.where( "recycler_id = ?", params[:id] )
  end

  def destroy
    Recycler.delete(params[:id])
    redirect_to recyclers_path
  end



end
