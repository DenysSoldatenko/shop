# frozen_string_literal: true

# This is the ApplicationController class
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    account_path_url
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
