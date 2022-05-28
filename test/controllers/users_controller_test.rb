# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'must have index' do
    get users_path

    assert_response :success
  end

  test 'should show a user' do
    get user_path(users(:diego))

    assert_response :success
  end
end
