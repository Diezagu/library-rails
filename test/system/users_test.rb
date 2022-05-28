# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting index' do
    visit users_path

    assert_content 'Authors'
  end

  test 'visiting the show of user' do
    visit users_path
    click_link 'Show'

    assert_content users(:diego).name
  end
end
