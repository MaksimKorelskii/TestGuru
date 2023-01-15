class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :hello_flash_message, only: :create, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : root_path
  end

  def hello_flash_message
    flash[:notice] = "Привет, #{current_user.first_name}!" if current_user.present?
  end
end
