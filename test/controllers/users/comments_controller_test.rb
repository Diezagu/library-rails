# frozen_string_literal: true

require 'test_helper'

module Users
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    setup do
      sign_in(users(:diego))
    end

    test 'Should create a comment on a user' do
      user = users(:urbi)

      post user_comments_path(user, params: { comment: { text: 'Good user', author: users(:diego) } })

      assert_redirected_to user_path(user)
      assert_equal flash[:notice], 'Comment posted!'
    end

    test 'Should destroy a comment of a user' do
      user = users(:diego)
      comment = user.comments.create(author: users(:diego), text: 'nice user')

      delete user_comment_path(user, comment)

      assert_redirected_to user_path(user)
      assert_equal flash[:notice], 'Comment deleted!'
    end

    test 'should not destroy a comment if author is different to current user' do
      user = users(:diego)
      comment = user.comments.create(author: users(:urbi), text: 'nice user')

      assert_raises ActiveRecord::RecordNotFound do
        delete user_comment_path(user, comment)
      end
    end
  end
end
