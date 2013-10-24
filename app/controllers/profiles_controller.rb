class ProfilesController < ApplicationController

  def index
    @user = current_user
    @profiles = Profile.all
  end

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    profile = Profile.create(params[:profile])
    if profile.errors.empty?
      redirect_to profile_path(profile)
    else
      flash[:errors] = Profile.errors.full_messages
      @profile = Profile.new
      render :new
    end
  end

  def edit
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.update_attributes(params[:profile])
    redirect_to profile_path(profile)
  end

  def show
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  def destroy
    User.delete(params[:user_id])
    redirect_to profiles_path
  end
end
