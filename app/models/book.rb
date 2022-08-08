# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :number_of_pages, :synopsis, presence: true
  validates :cover, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  belongs_to :author, class_name: 'User'

  delegate :name, to: :author, prefix: 'author'
  has_one_attached :cover
  has_rich_text :synopsis
  has_many :comments, as: :commentable
  has_many :likes, dependent: :delete_all
  after_create :create_notifications

  private

  def create_notifications
    author.followers.each do |follower|
      user = User.find_by(id: follower.follower_id)
      UserMailer.with(user: user, current_user: author, book: self).notification_email.deliver_now
      Notification.create(title: 'New book created',
                          text: "#{author.name} has published a new book",
                          author_id: follower.follower_id)
    end
  end
end
