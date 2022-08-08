# frozen_string_literal: true

require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:diego)
  end

  test 'should delete a notification using the DELETE method of notification' do
    delete notification_path(notifications(:book))

    assert_redirected_to users_path
  end
end
