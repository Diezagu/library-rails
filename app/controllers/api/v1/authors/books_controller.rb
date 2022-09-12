# frozen_string_literal: true

module Api
  module V1
    module Authors
      class BooksController < ApplicationController
        def index
          if User.find_by(id: params[:author_id])
            render json: User.find(params[:author_id]).books
          else
            render json: {}, status: :not_found
          end
        end
      end
    end
  end
end
