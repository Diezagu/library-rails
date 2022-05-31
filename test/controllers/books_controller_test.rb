# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'must have index' do
    get books_path

    assert_response :success
  end

  test 'Should have new' do
    get new_book_path

    assert_response :success
  end

  test 'should create a book' do
    user = users(:diego)
    post books_path(params: { book: { title: 'DSA', pages: 224, author_id: user.id } })

    assert_equal 'Book created!', flash[:notice]
  end

  test 'Should have edit' do
    get edit_book_path(books(:first))

    assert_response :success
  end

  test 'Should update a book' do
    book = books(:first)
    user = users(:diego)
    put book_path(book, params: { book: { title: 'New', pages: 200, author_id: user.id } })

    assert_equal 'Book updated!', flash[:notice]
    assert_redirected_to book_path(book)
  end

  test 'Should show a book' do
    get book_path(books(:first))

    assert_response :success
  end

  test 'Should delete a book' do
    delete book_path(books(:first))

    assert_equal 'Book deleted!', flash[:notice]
    assert_redirected_to books_path
  end
end
