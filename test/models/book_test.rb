# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'it is not valid without title' do
    book = Book.new(pages: 224, author: users(:diego))

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:title].first
  end

  test 'it is not valid without pages' do
    book = Book.new(title: 'SSD', author: users(:diego))

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:pages].first
  end

  test 'it is not valid without author' do
    book = Book.new(title: 'SSD', pages: 224)

    refute book.valid?
    assert_equal 'must exist', book.errors.messages[:author].first
  end

  test 'it is valid with author, pages and title' do
    book = Book.new(title: 'SSD', pages: 224, author: users(:diego))

    assert book.valid?
  end
end
