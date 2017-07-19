class Api::V1::BaseController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  protect_from_forgery unless: -> { request.format.json? }
  
  def require_login
    authenticate_token || render_unauthorized("Access denied")
  end
  
  def current_user
    @current_user ||= authenticate_token
  end
  
  protected

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end
  
  def not_found
    return api_error(status: 404, errors: 'Not found')
  end
  
  private

  def authenticate_token
    authenticate_with_http_token do |token, options|
      if @user = User.find_by(token: token)
        ActiveSupport::SecurityUtils.secure_compare(
                      ::Digest::SHA256.hexdigest(token),
                      ::Digest::SHA256.hexdigest(user.token))
        @user
      end
    end
  end
  
end
