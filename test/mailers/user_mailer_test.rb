# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'notification' do
    email = UserMailer.with(follower_id: users(:urbi).id,
                            author_id: users(:diego).id,
                            book_id: books(:first).id).notification_email

    assert_emails 1 do
      email.deliver_now
    end
    assert_equal ['notifications@library.com'], email.from
    assert_equal ['user2@example.com'], email.to
    assert_equal 'New book created!', email.subject
    assert_includes email.body, 'Hi! Urbi'
  end
end
