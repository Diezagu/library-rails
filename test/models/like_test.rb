# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test 'Like is not valid without author' do
    like = Like.new(book: books(:first))

    refute like.valid?
    assert_equal 'must exist', like.errors.messages[:author].first
  end

  test 'Like is not valid without book' do
    like = Like.new(author: users(:diego))

    refute like.valid?
    assert_equal 'must exist', like.errors.messages[:book].first
  end

  test 'Like must be valid with book and author' do
    like = Like.new(author: users(:diego), book: books(:first))

    assert like.valid?
  end
end
