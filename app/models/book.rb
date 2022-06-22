# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :number_of_pages, presence: true
  validates :cover, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  belongs_to :author, class_name: 'User'

  delegate :name, to: :author, prefix: 'author'
  has_one_attached :cover
  has_many :comments, as: :commentable
end
