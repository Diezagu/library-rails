# frozen_string_literal: true

class NotificationsController < ApplicationController
  def create
    notification = Notification.new(permitted_params)
    flash[:alert] = 'Error while creating notification' unless notification.save
  end

  def destroy
    notification = Notification.find(params[:id])
    flash[:alert] = 'Error while destroying notification' unless notification.destroy
    redirect_to users_path
  end

  private

  def permitted_params
    params.require(:notification).permit(:title, :text, :author_id)
  end
end
