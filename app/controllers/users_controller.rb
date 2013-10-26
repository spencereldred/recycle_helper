class UsersController < ApplicationController

  skip_before_filter :authorize, only: [:new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
    @function = params[:function]
  end

  def create
    @user = User.create(params[:user])

    if @user.save
        # binding.pry
        Hi5Mailer.welcome_user(@user).deliver
      end

    if @user.errors.empty?
      sign_in(@user)
      redirect_to new_profile_path(user: @user.id, function: @user.function)
    else
      flash[:errors] = ["Error!"]
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end


end
