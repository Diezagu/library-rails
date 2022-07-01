# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:diego)
    sign_in @user
    visit users_path
  end

  test 'visiting index' do
    assert_content 'Authors'
  end

  test 'Creating a book' do
    click_on 'Create a book'
    fill_in 'Title', with: 'NEW BOOK'
    fill_in 'Pages', with: 222
    find('trix-editor').set('Hello <em>world!</em>')
    click_on 'Create Book'

    assert_content 'Book created!'
  end

  test 'Updating a book' do
    click_on 'Profile'
    click_on 'Edit'
    fill_in 'Title', with: 'NEW BOOK'
    fill_in 'Pages', with: 222
    find('trix-editor').set('Hello <em>world!</em>')
    take_screenshot
    click_on 'Update Book'

    assert_content 'Book updated!'
  end

  test 'Showing a book' do
    click_on 'Profile'
    click_on 'Show'
    assert_content books(:first).title
  end

  test 'Deleting a book' do
    click_on 'Profile'
    accept_alert do
      click_link('Delete')
    end

    assert_content 'Book deleted!'
  end
end
