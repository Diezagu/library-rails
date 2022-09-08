class SendBookCreatedNotificationToUsersJob < ApplicationJob
  queue_as :default

  def perform(author_id, book_id)
    followers = Follow.where(followee_id: author_id)
    author = User.find_by(id: author_id)
    followers.each do |follower|
      UserMailer.with(follower_id: follower.id, author_id: author_id, book_id: book_id).notification_email.deliver_now
      Notification.create(title: 'New book created',
                          text: "#{author.name} has published a new book",
                          author_id: follower.id)
    end
  end
end
