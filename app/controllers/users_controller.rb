# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show destroy]
  def index
    @users = User.all
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:notice] = 'User deleted!'
    else
      flash[:alert] = 'Error while deleting user!'
    end
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end