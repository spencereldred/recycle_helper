class ApplicationController < ActionController::Base
  # Turn on request forgery protection
  protect_from_forgery

  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  include SessionsHelper

  def authorize
    # sends user back to login page if current_user is nil
    redirect_to new_session_path unless current_user
  end

  def authorize_redeemer #redeemer or admin or super_admin
    redirect_to root_path unless current_user.function == "redeemer" || current_user.function == "admin" || current_user.function == "super_admin"
  end

  def authorize_recycler #recycler or admin or super_admin
    redirect_to root_path unless  current_user.function == "recycler" || current_user.function == "admin" || current_user.function == "super_admin"
  end

  def authorize_admin # admin or super_admin
    redirect_to root_path unless current_user.function == "admin" || current_user.function == "super_admin"
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end
