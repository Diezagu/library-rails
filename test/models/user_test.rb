require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it is not valid without name' do
    user = User.new(age: 24)

    refute user.valid?
    assert_equal user.errors.messages[:name].first, "can't be blank"
  end

  test 'it is not valid without age' do
    user = User.new(name: 'Diego')

    refute user.valid?
    assert_equal user.errors.messages[:age].first, "can't be blank"
  end

  test 'it is not valid if age is greater than 100' do
    user = User.new(name: 'Diego', age: 101)

    refute user.valid?
    assert_equal user.errors.messages[:age].first, 'must be less than 100'
  end

  test 'it is not valid if age is lower or equal 0' do
    user = User.new(name: 'Diego', age: 0)

    refute user.valid?
    assert_equal user.errors.messages[:age].first, 'must be greater than 0'
  end

  test 'it is valid with name and age' do
    user = User.new(name: 'Diego', age: 24)

    assert user.valid?
  end
end
