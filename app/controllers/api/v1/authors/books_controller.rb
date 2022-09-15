# frozen_string_literal: true

module Api
  module V1
    module Authors
      class BooksController < ApplicationController
        before_action :setup_author

        def index
          render json: @author.books
        end

        private

        def setup_author
          @author = User.find_by(id: params[:author_id])
          render json: {}, status: :not_found unless @author
        end
      end
    end
  end
end
