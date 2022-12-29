class SessionsController < ApplicationController
  # skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
      # redirect_to cookies.delete(:path) || tests_path
    else
      flash.now[:alert] = "Are you a Guru? Verify your email and password"
      render :new
    end
  end

  # def destroy
  #   session.delete(:user_id)
  #   @current_user = nil
  #   redirect_to tests_path
  # end
end
