# frozen_string_literal: true

class User < ApplicationRecord
  def liked_book?(book)
    book.likes.exists?(author: self)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :age, presence: true
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  validates :age, numericality: { greater_than: 0, less_than: 100 }

  has_many :books, foreign_key: 'author_id'
  has_many :comments, as: :commentable
  has_one_attached :avatar
end
