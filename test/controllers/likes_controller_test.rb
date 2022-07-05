# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(users(:diego))
  end

  test 'Liking a book' do
    book = books(:first)
    post likes_path(params: { like: { author_id: users(:diego).id, book_id: book.id } })

    assert_redirected_to '/'
  end

  test 'Unliking a book' do
    book = books(:first)
    like = book.likes.create(author_id: users(:diego).id)

    delete like_path(like)

    assert_redirected_to '/'
  end
end
