# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :book
end