# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'notification' do
    # Create the email and store it for further assertions
    email = UserMailer.with(user: users(:urbi),
                            current_user: users(:diego),
                            book: books(:first)).notification_email

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['notifications@library.com'], email.from
    assert_equal ['user2@example.com'], email.to
    assert_equal 'New book created!', email.subject
    assert_includes email.body, 'Hi! Urbi'
  end
end
