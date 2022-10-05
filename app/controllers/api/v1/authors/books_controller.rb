# frozen_string_literal: true

class Api::V1::Authors::BooksController < Api::ApiController
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
