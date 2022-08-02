# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :title, :text, presence: true
  belongs_to :author, class_name: 'User'
end
