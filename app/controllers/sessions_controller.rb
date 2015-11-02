class SessionsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by_username( params[:username] )

    if user && user.authenticate( params[:password] ) # authenticate is a bycrypt method
      sign_in(user)

      case user[:function]
        when "redeemer"
          redirect_to redeemers_path
        when "recycler"
          redirect_to transactions_path
        when "admin"
          redirect_to admins_path
        else
          puts "I'm not a redeemer."
      end

    else
      # flash[:danger] = "Login error: check username and password."
      redirect_to root_path
    end

  end

  def destroy
    sign_out
    flash[:info] = "Signed out!"
    redirect_to root_path
  end

end
