class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by_username( params[:username] )

    if user && user.authenticate( params[:password] ) # authenticate is a bycrypt method
      sign_in(user)

      if user[:function] == "redeemer"
        redirect_to redeemers_path
      else
        redirect_to transactions_path
      end
    else
      flash[:errors] = ["Login error: check username and password."]
      redirect_to root_path
    end

  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Signed out!"
  end

end
