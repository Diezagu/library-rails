# frozen_string_literal: true

require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  test 'it is not valid without follower' do
    follow = Follow.new(followee: users(:diego))

    refute follow.valid?
    assert_equal follow.errors.messages[:follower].first, 'must exist'
  end

  test 'it is not valid without followee' do
    follow = Follow.new(follower: users(:urbi))

    refute follow.valid?
    assert_equal follow.errors.messages[:followee].first, 'must exist'
  end

  test 'it is valid with follower and followee' do
    follow = Follow.new(follower: users(:urbi), followee: users(:diego))

    assert follow.valid?
  end
end
