# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:diego)
    sign_in @user
    visit users_path
  end

  test 'Should visit the users index page and show them' do
    assert_content 'Authors'
  end

  test 'Should visit the page of a user and show its information' do
    click_link 'Show'

    assert_content users(:urbi).name
  end
end
