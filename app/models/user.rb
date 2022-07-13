# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def followed_by?(user)
    followers.exists?(follower_id: user.id)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :age, presence: true
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :age, numericality: { greater_than: 0, less_than: 100 }

  has_many :books, foreign_key: 'author_id'
  has_many :comments, as: :commentable
  has_many :followers, class_name: 'Follow', foreign_key: 'followee_id', dependent: :delete_all
  has_one_attached :avatar

  def liked_book?(book)
    book.likes.exists?(author: self)
  end
end
