# frozen_string_literal: true

# This is the ApplicationController class
class ApplicationController < ActionController::Base

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def index
    @categories = Category.where(parent_id: nil)
  end
end
