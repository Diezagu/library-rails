# frozen_string_literal: true

module Users
  class CommentsController < ApplicationController
    before_action :setup_user
    def create
      @comment = @user.comments.new(permitted_params)
      if @comment.save
        flash[:notice] = 'Comment posted!'
      else
        flash[:alert] = 'Error while posting a comment'
      end
      redirect_to user_path(@user)
    end

    def destroy
      @comment = @user.comments.find_by!(id: params[:id], author: current_user)

      if @comment.destroy
        flash[:notice] = 'Comment deleted!'
      else
        flash[:alert] = 'Error while deleting a comment'
      end
      redirect_to user_path(@user)
    end

    private

    def permitted_params
      params.require(:comment).permit(:text).merge(author_id: current_user.id)
    end

    def setup_user
      @user = User.find(params[:user_id])
    end
  end
end
