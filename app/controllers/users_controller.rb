# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'User deleted!'
    else
      flash[:alert] = 'Error while deleting user!'
    end
    redirect_to users_path
  end
end
