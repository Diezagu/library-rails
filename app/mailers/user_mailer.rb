class UserMailer < ApplicationMailer
  default from: 'notifications@library.com'

  def notification_email
    @user = params[:user]
    @current_user = params[:current_user]
    @book = params[:book]
    mail(to: @user.email, subject: 'New book created!')
  end
end
