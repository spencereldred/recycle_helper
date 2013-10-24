class HelpersController < ApplicationController
  before_filter :authorize, except: [:new]
  before_filter :authorize_redeemer, except: [:new]

  def index
    @user = current_user
    @redeemer = Redeemer.find_by_user_id(@user.id)
  end

  def show
    @user = current_user
    @redeemer = Redeemer.find(params[:id])
  end

  def new
    @user = User.new
    @function = 'redeemer'
  end

  def create
    puts "$$$$$$$$$ Made it to create: #{params[:user]}"
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      redirect_to helpers_profile_path
    else
      flash[:errors] = ["Error!"]
      render :new
    end
  end

  def edit
    @redeemer = Redeemer.find(params[:id])
  end

  def update
    puts "$$$$$$$$$$$$$$$ Update Method: #{params[:id]}"
    redeemer = Redeemer.find(params[:id])
    redeemer.update_attributes(params[:redeemer])
    redirect_to helper_path(redeemer)
  end

  def destroy
    Redeemer.delete(params[:id])
    redirect_to logout_path
  end

  def profile
    @user = current_user
    @redeemer = Redeemer.new

  end

  def create_profile
    redeemer = Redeemer.create(params[:redeemer])
    if redeemer.errors.empty?
      redirect_to helper_path(redeemer)
    else
      flash[:errors] = redeemer.errors.full_messages
      @redeemer = Redeemer.new
      render :new
    end
  end

end
