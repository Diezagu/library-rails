# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :number_of_pages, presence: true
  belongs_to :author, class_name: 'User'

  delegate :name, to: :author, prefix: 'author'
end
