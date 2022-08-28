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
  after_commit :notify_followers, on: :create

  private

  def notify_followers
    SendBookCreatedNotificationToUsersJob.perform_later(author, self)
  end
end
