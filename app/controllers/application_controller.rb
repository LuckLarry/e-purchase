class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize
  before_filter :require_user
  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  protected   
  def authorize
    unless current_user
      redirect_to login_path 
    end
  end

  def require_user
    if current_user
      session[:user_id] = @current_user.id
      session[:username] = @current_user.username
    end
  end
end
