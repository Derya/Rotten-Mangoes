class Admin::ShadowSessionsController < ApplicationController

  def new
  end

  def create
    restrict_to_admin

    if params[:user_id] != session[:user_id] && user = User.find(params[:user_id]) 
      session[:shadow_id] = session[:user_id]
      session[:user_id] = user.id
      redirect_to movies_path, notice: "Logged in as #{user.firstname}, account #{User.find(session[:shadow_id]).firstname} in shadow mode"
    else
      flash.now[:alert] = "Login failed"
      render :new
    end
  end

  def destroy
    user = User.find(session[:user_id])
    shadow = User.find(session[:shadow_id])

    if shadow && shadow.admin
      session[:user_id] = session[:shadow_id]
      session[:shadow_id] = nil
      redirect_to admin_users_path, notice: "No longer logged in as #{user.email}, now logged in as #{shadow.email}"
    else
      session[:user_id] = nil
      session[:shadow_id] = nil
      redirect_to movies_path, notice: "Logged out."
    end
  end

  
end
