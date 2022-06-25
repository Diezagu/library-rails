# frozen_string_literal: true

require 'test_helper'

module Books
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in(users(:diego))
    end

    test 'Should create a comment on a book' do
      book = books(:first)

      post book_comments_path(book, params: { comment: { text: 'Good book', author: users(:diego) } })

      assert_redirected_to book_path(book)
      assert_equal flash[:notice], 'Comment posted!'
    end

    test 'Should destroy a comment of a book' do
      book = books(:first)
      comment = book.comments.create(author: comments(:book_diego).author , text: comments(:book_diego).text)

      delete book_comment_path(book, comment)

      assert_redirected_to book_path(book)
      assert_equal flash[:notice], 'Comment deleted!'
    end

    test 'Should not destroy a comment if author is different to current user' do
      book = books(:first)
      comment = book.comments.create(author: comments(:book_urbi).author, text: comments(:book_urbi).text)

      assert_raises ActiveRecord::RecordNotFound do
        delete book_comment_path(book, comment)
      end
    end
  end
end
