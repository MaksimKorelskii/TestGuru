class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :hello_flash_message, only: :create, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(current_user)
    current_user.is_a?(Admin) ? admin_tests_path : root_path
  end

  def hello_flash_message
    flash[:notice] = "Hello, #{current_user.first_name}!" #if current_user.first_name.present?
  end
end
