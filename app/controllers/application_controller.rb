class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def restrict_to_admin
    if !current_user || !current_user.admin
      flash[:alert] = "You must log in as an admin."
      redirect_to new_session_path
    end
  end

  def clear_shadow
    session[:shadow_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def shadow_user
    @shadow_user ||= User.find(session[:shadow_id]) if session[:shadow_id]
  end

  helper_method :shadow_user
  helper_method :current_user

end