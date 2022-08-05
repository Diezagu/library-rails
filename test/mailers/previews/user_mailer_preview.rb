# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def notification_email
    UserMailer.with(user: User.last, current_user: User.first, book: Book.first).notification_email
  end
end
