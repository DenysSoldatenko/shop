# frozen_string_literal: true

# This is the CustomRegistrationController class
class CustomRegistrationController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name surname patronymic])
  end
end
