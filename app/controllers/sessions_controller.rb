class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new
    #flash[:errors] = []
  end

  def create
    user = User.find_by_email( params[:email] )
    if user && user.authenticate( params[:password] ) # authenticate is a bycrypt method
      sign_in(user)
      redirect_to root_path
    else
      flash[:errors] = ["Error!"]
      render :new
    end

  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

end
