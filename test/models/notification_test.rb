# frozen_string_literal: true

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test 'it is not valid without title' do
    notification = Notification.new(text: notifications(:book).text)

    refute notification.valid?
    assert_equal "can't be blank", notification.errors.messages[:title].first
  end

  test 'it is not valid without text' do
    notification = Notification.new(title: notifications(:book).title)

    refute notification.valid?
    assert_equal "can't be blank", notification.errors.messages[:text].first
  end

  test 'it is valid with text and title' do
    notification = Notification.new(title: notifications(:book).title,
                                    text: notifications(:book).text,
                                    author: users(:diego))

    assert notification.valid?
  end
end
