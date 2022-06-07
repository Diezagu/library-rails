# frozen_string_literal: true

class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(permitted_params)
    @book.author_id = current_user.id
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
    @book = Book.find(params[:id])
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

  def permitted_params
    params.require(:book).permit(:title, :number_of_pages, :author_id)
  end
end
