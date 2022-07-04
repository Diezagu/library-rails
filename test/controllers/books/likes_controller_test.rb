require 'test_helper'

module Books
  class LikesControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in(users(:diego))
    end

    test 'Liking a book' do
      book = books(:first)
      post book_likes_path(book, params: { like: { author_id: users(:diego).id } })

      assert_redirected_to user_path(users(:diego))
    end

    test 'Unliking a book' do
      book = books(:first)
      like = book.likes.create(author_id: users(:diego).id)

      delete book_like_path(book, like)

      assert_redirected_to user_path(users(:diego))
    end
  end
end
