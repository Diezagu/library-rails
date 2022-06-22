require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'it is not valid without author' do
    comment = Comment.new(text: 'Nice book')

    refute comment.valid?
    assert_equal 'must exist', comment.errors.messages[:author].first
  end

  test 'it is not valid without text' do
    comment = Comment.new(author: users(:diego))

    refute comment.valid?
    assert_equal "can't be blank", comment.errors.messages[:text].first
  end

  test 'it is valid with author and text' do
    debugger
    comment = Comment.new(author: users(:diego), text: 'Nice book', commentable: books(:first))

    assert comment.valid?
  end
end
