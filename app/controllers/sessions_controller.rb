class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new
    #flash[:errors] = []
  end

  def create
    user = User.find_by_username( params[:username] )
    if user && user.authenticate( params[:password] ) # authenticate is a bycrypt method
      sign_in(user)
      #redirect_to root_path, :notice => "Signed in!"
      if user[:function] == "redeemer"
        redirect_to redeemers_path
      else
        redirect_to new_transaction_path
      end
    else
      flash[:errors] = ["Error!"]
      render :new
    end

  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "Signed out!"
  end

end
