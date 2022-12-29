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
      render :new
      # flash[:alert] = "Are you a Guru? Please enter email and password"
    end
  end

  # def destroy
  #   session.delete(:user_id)
  #   @current_user = nil
  #   redirect_to tests_path
  # end
end
