class ApplicationController < ActionController::Base
  protect_from_forgery

  include SessionsHelper

  # before_filter :authorize

  def authorize
    # sends user back to login page if current_user is nil
    redirect_to new_session_path if !current_user
  end

end
