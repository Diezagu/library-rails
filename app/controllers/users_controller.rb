# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show destroy]
  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @comment = Comment.new
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
