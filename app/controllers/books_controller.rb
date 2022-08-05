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
    if @book.save
      flash[:notice] = 'Book created!'
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = 'Error while creating a book'
      render :new
    end
    create_notifications(@book)
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

  def create_notifications(book)
    current_user.followers.each do |follower|
      user = User.find_by(id: follower.follower_id)
      UserMailer.with(user: user, current_user: current_user, book: book).notification_email.deliver_now
      notification = Notification.new(title: 'New book created',
                                      text: "#{current_user.name} has published a new book",
                                      author_id: follower.follower_id)
      notification.save
    end
  end

  def permitted_params
    params.require(:book)
          .permit(:title, :number_of_pages, :author_id, :cover, :synopsis)
          .merge(author: current_user)
  end
end
