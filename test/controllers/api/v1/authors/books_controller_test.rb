# frozen_string_literal: true

require 'test_helper'

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get books of an specific author' do
    book = {
      id: books(:first).id,
      title: books(:first).title,
      number_of_pages: books(:first).number_of_pages,
      author_id: books(:first).author_id,
      created_at: books(:first).created_at.iso8601(3),
      updated_at: books(:first).updated_at.iso8601(3)
    }
    header = {'Authorization' => "Token #{Rails.application.credentials.dig(:auth, :token).to_s}"}

    get api_v1_author_books_path(users(:diego)), headers: header

    assert_response :success
    assert_equal [book.as_json], JSON.parse(response.body)
  end
end
