class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  # before_filter :authorize

  def authorize
    # sends user back to login page if current_user is nil
    redirect_to new_session_path if !current_user
  end

  def authorize_redeemer #helper
    redirect_to root_path unless  current_user.function == "admin" || current_user.function == "redeemer"
  end

  def authorize_recycler #supplier
    redirect_to root_path unless current_user.function == "admin" || current_user.function == "recycler"
  end

  def authorize_admin
    redirect_to root_path if current_user.function != "admin"
  end

end
