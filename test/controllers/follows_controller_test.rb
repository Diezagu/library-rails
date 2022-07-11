# frozen_string_literal: true

require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:diego)
  end

  test 'following an author' do
    post follows_path(follow: { followee: users(:diego) })

    assert_redirected_to '/'
  end

  test 'unfollowing an author' do
    user = users(:diego)
    follow = user.followers.create(follower: users(:urbi), followee: user)

    delete follow_path(follow)

    assert_redirected_to '/'
  end
end
