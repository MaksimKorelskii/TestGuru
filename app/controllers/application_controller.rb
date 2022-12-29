class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  helper_method :current_user# , :logged_in?, :current_user?

  private

  def authenticate_user!
    return if current_user

    cookies[:path] = request.fullpath
    redirect_to login_path, alert: "Are you a Guru? Enter Email and Password."
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    @current_user.present?
  end
end
