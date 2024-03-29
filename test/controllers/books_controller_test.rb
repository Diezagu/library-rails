# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:diego)
    sign_in @user
  end

  test 'must have index' do
    get books_path

    assert_response :success
  end

  test 'should visit the new book path' do
    get new_book_path

    assert_response :success
  end

  test 'should create a book' do
    post books_path(params: { book: { title: 'DSA',
                                      number_of_pages: 224,
                                      synopsis: 'Nice book to programmers!' } })

    assert_equal 'Book created!', flash[:notice]
  end

  test 'should visit the edit path' do
    get edit_book_path(books(:first))

    assert_response :success
  end

  test 'should update a book' do
    book = books(:first)
    user = users(:diego)
    put book_path(book, params: { book: { title: 'New',
                                          number_of_pages: 200,
                                          author_id: user.id,
                                          synopsis: 'Nice book to programmers' } })

    assert_equal 'Book updated!', flash[:notice]
    assert_redirected_to user_path(user)
  end

  test 'should show a book' do
    get book_path(books(:first))

    assert_response :success
  end

  test 'should delete a book' do
    delete book_path(books(:first))

    assert_equal 'Book deleted!', flash[:notice]
    assert_redirected_to user_path(users(:diego))
  end
end
