# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:diego)
    sign_in @user
    visit users_path
  end

  test 'visiting index' do
    assert_content 'Authors'
  end

  test 'visiting the show of user' do
    click_link 'Show'

    assert_content users(:urbi).name
  end
end
