# frozen_string_literal: true

module UsersHelper
  def liked_book?(book)
    book.likes.find_by(author_id: current_user.id) ? true : false
  end
end
