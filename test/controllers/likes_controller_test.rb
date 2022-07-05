# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(users(:diego))
  end

  test 'liking a book' do
    book = books(:first)
    post likes_path(params: { like: { author: users(:diego), book_id: book.id } })

    assert_redirected_to '/'
  end

  test 'unliking a book' do
    book = books(:first)
    like = book.likes.create(author: users(:diego))

    delete like_path(like)

    assert_redirected_to '/'
  end
end
