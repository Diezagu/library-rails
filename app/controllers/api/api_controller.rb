# frozen_string_literal: true

class Api::ApiController < ApplicationController
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token|
      ActiveSupport::SecurityUtils.secure_compare(token,
                                                  Rails.application.credentials.dig(:auth,
                                                                                    :token).to_s)
    end
  end
end
