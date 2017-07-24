class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?, :require_admin
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if
    session[:user_id]
  end

  def require_user
    redirect_to root_path unless current_user
  end
  
  def require_admin
    redirect_to root_path flash[:alert] = "You are not an admin" unless is_admin?
  end
  
  def is_admin?
    current_user && current_user.is_admin === 1
  end
  
end
