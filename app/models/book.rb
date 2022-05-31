# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :pages, presence: true
  belongs_to :author, class_name: 'User'
end
