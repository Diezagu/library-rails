class LikesController < ApplicationController
  def create
    @like = Like.new(permitted_params)
    if !@like.save
      flash.now[:alert] = 'Error while liking book!'
    end
    render :show
  end

  def destroy
    @like = Like.find(params[:id])
    if !@like.destroy
      flash.now[:alert] = 'Error while unliking book!'
    end
    render :show
  end

  private

  def permitted_params
    params.require(:like).permit(:author_id, :book_id)
  end
end
