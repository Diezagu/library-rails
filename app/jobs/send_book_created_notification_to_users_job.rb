class SendBookCreatedNotificationToUsersJob < ApplicationJob
  queue_as :default

  def perform(author, book)
    author.followers.each do |follower|
      user = User.find_by(id: follower.follower_id)
      UserMailer.with(user: user, current_user: author, book: book).notification_email.deliver_now
      Notification.create(title: 'New book created',
                          text: "#{author.name} has published a new book",
                          author_id: follower.follower_id)
    end
  end
end
