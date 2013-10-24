class SuppliersController < ApplicationController
  before_filter :authorize, except: [:new]
  before_filter :authorize_recycler, except: [:new]

  def index
    @user = current_user
    @recycler = Recycler.find_by_user_id(@user.id)
  end

  def show
    @user = current_user
    @recycler = Recycler.find(params[:id])
  end

  def new
    @user = User.new
    @function = 'recycler'
  end

  def create
    puts "$$$$$$$$$ Made it to create: #{params[:user]}"
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      redirect_to suppliers_profile_path
    else
      flash[:errors] = ["Error!"]
      render :new
    end
  end

  def edit
    @recycler = Recycler.find(params[:id])
  end

  def update
    recycler = Recycler.find(params[:id])
    recycler.update_attributes(params[:recycler])
    redirect_to supplier_path(recycler)
  end

  def destroy
    Recycler.delete(params[:id])
    redirect_to logout_path
  end


  def profile
    @user = current_user
    @recycler = Recycler.new
  end

  def create_profile
    recycler = Recycler.create(params[:recycler])
    if recycler.errors.empty?
      redirect_to recycler_path(recycler)
    else
      flash[:errors] = recycler.errors.full_messages
      @recycler = Recycler.new
      render :new
    end
  end


end
