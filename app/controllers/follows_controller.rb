# frozen_string_literal: true

class FollowsController < AuthenticationController
  def create
    @follow = Follow.new(permitted_params)
    flash.now[:alert] = 'Error while following author!' unless @follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @follow = Follow.find(params[:id])
    flash.now[:alert] = 'Error while unfollowing author!' unless @follow.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def permitted_params
    params.require(:follow)
          .permit(:followee_id)
          .merge(follower: current_user)
  end
end
