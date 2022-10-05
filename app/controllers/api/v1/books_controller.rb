# frozen_string_literal: true

class Api::V1::BooksController < Api::ApiController
  def index
    @books = Book.all
    render json: @books
  end
end
