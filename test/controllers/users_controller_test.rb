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

  test 'should delete a user' do
    delete user_path(users(:diego))

    assert_equal flash[:notice], 'User deleted!'
    assert_redirected_to users_path
  end
end
