module Books
  class LikesController < ApplicationController
    def create
      @like = Like.new(permitted_params)
      if !@like.save
        flash[:alert] = 'Error while liking book!'
      end
      redirect_to user_path(current_user)
    end

    def destroy
      @like = Like.find(params[:id])
      if !@like.destroy
        flash.now[:alert] = 'Error while unliking book!'
      end
      redirect_to user_path(current_user)
    end

    private

    def permitted_params
      params.require(:like).permit(:author_id, :book_id)
    end
  end
end
