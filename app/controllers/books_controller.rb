# frozen_string_literal: true

class BooksController < ApplicationController
  skip_before_action :authenticate_user!, if: :skip_authenticate_user

  def index
    @books = Book.all
    respond_to do |format|
      format.html
      format.json { authenticate_user(params[:email], params[:password]) }
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(permitted_params)
    if @book.save
      flash[:notice] = 'Book created!'
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = 'Error while creating a book'
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id], author: current_user)
    if @book.update(permitted_params)
      flash[:notice] = 'Book updated!'
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = 'Error while updating the book'
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = 'Book deleted!'
    else
      flash[:alert] = 'Error while deleting book'
    end
    redirect_to user_path(current_user)
  end

  private

  def skip_authenticate_user
    action_name == 'index' && request.format.json?
  end

  def authenticate_user(email, password)
    user = User.where(email: email).first
    if user&.valid_password?(password)
      render json: @books
    else
      head(:unauthorized)
    end
  end

  def permitted_params
    params.require(:book)
          .permit(:title, :number_of_pages, :author_id, :cover, :synopsis)
  end
end
