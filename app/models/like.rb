# frozen_string_literal: true

class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :book_id }
  belongs_to :author, class_name: 'User'
  belongs_to :book
end
