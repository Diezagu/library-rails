class UserMailer < ApplicationMailer
  default from: 'notifications@library.com'

  def notification_email
    follower_id = params[:follower_id]
    author_id = params[:author_id]
    book_id = params[:book_id]
    @follower = User.find(follower_id)
    @author = User.find(author_id)
    @book = Book.find(book_id)
    mail(to: @follower.email, subject: 'New book created!')
  end
end
