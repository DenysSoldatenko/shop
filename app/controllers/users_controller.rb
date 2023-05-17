# frozen_string_literal: true

# This is the UsersController class
class UsersController < ApplicationController
  def index
    @user = current_user
  end
  def settings; end
  def info ; end
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end

  def info_change
    @user = current_user
  end

  def info_update
    @user = current_user
    if @user.update(user_params)
      redirect_to settings_path_url, notice: "Дані успішно оновлено."
    else
      render :info_change
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :patronymic)
  end
end
