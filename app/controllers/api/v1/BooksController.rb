# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @books = Book.all
    render json: @books
  end
end
