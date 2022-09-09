# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      skip_before_action :authenticate_user!

      def index
        @books = Book.all
        render json: @books
      end
    end
  end
end
