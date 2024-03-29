# frozen_string_literal: true

class LikesController < AuthenticationController
  def create
    @like = Like.new(permitted_params)
    flash[:alert] = 'Error while liking book!' unless @like.save
    redirect_back(fallback_location: '/')
  end

  def destroy
    @like = Like.find(params[:id])
    flash.now[:alert] = 'Error while unliking book!' unless @like.destroy
    redirect_back(fallback_location: '/')
  end

  private

  def permitted_params
    params.require(:like)
          .permit(:book_id)
          .merge(author: current_user)
  end
end
