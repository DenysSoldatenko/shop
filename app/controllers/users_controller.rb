# frozen_string_literal: true

# This is the UsersController class
class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def settings; end
  def my_account; end
  def user_account; end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end

  def password_change
    @user = current_user
  end

  def password_update
    @user = current_user
    if @user.update(user_password)
      bypass_sign_in(@user)
      redirect_to settings_path_url
    else
      flash.now[:alert] = 'Помилка при оновленні паролю.'
      render :password_change
    end
  end

  def info_change
    @user = current_user
  end

  def info_update
    @user = current_user
    if @user.update(user_params)
      redirect_to settings_path_url
    else
      flash.now[:alert] = 'Помилка при оновленні  інформації.'
      render :info_change
    end
  end

  def email_change
    @user = current_user
  end

  def email_update
    @user = current_user
    if @user.update(user_email)
      redirect_to settings_path_url
    else
      flash.now[:alert] = 'Помилка при оновленні пошти.'
      render :email_change
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :patronymic)
  end

  def user_password
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_email
    params.require(:user).permit(:email)
  end
end
