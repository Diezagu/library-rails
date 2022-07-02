# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'it is not valid without title' do
    book = Book.new(number_of_pages: 224, author: users(:diego))

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:title].first
  end

  test 'it is not valid without number of pages' do
    book = Book.new(title: 'SSD', author: users(:diego))

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:number_of_pages].first
  end

  test 'it is not valid without author' do
    book = Book.new(title: 'SSD', number_of_pages: 224)

    refute book.valid?
    assert_equal 'must exist', book.errors.messages[:author].first
  end

  test 'it is not valid without synopsis' do
    book = Book.new(title: 'SSD',
                    number_of_pages: 224,
                    author: users(:diego))

    refute book.valid?
    assert_equal "can't be blank", book.errors.messages[:synopsis].first
  end

  test 'it is valid with author, number of pages, title and synopsis' do
    book = Book.new(title: 'SSD',
                    number_of_pages: 224,
                    author: users(:diego),
                    synopsis: 'Great book to programmers!')

    assert book.valid?
  end
end
