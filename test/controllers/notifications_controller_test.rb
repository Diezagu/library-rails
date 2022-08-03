# frozen_string_literal: true

require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:diego)
  end

  test 'should throw an exception because the information to create a notification is incomplete' do
    user = users(:urbi)
    post notifications_path(params: { notification: { text: notifications(:book).text, author_id: user.id } })

    assert_response 204
    assert_equal flash[:alert], 'Error while creating notification'
  end

  test 'should create a notification for a user using the POST method of notification' do
    post notifications_path(params: { notification: { title: notifications(:book).title,
                                                      text: notifications(:book).text,
                                                      author_id: users(:urbi).id } })

    assert_response :success
  end

  test 'should delete a notification using the DELETE method of notification' do
    delete notification_path(notifications(:book))

    assert_response :success
  end
end
