# frozen_string_literal: true

module Books
  class CommentsController < ApplicationController
    before_action :setup_book

    def create
      @comment = @book.comments.new(permitted_params)
      if @comment.save
        flash[:notice] = 'Comment posted!'
      else
        flash[:alert] = 'Error while posting a comment'
      end
      redirect_to book_path(@book)
    end

    def destroy
      @comment = @book.comments.find_by!(id: params[:id], author: current_user)

      if @comment.destroy
        flash[:notice] = 'Comment deleted!'
      else
        flash[:alert] = 'Error while deleting a comment'
      end
      redirect_to book_path(@book)
    end

    private

    def permitted_params
      params.require(:comment).permit(:text).merge(author_id: current_user.id)
    end

    def setup_book
      @book = Book.find(params[:book_id])
    end
  end
end
