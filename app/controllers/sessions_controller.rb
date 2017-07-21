class SessionsController < ApplicationController
  
  def create
    @user = User.find_by_email(params[:session][:email])
    
    if @user && @user.authenticate(params[:session][:password])
      if @user.is_admin?
        session[:user_id] = @user.id
        flash[:notice] = "Successfully Logged in."
        redirect_to admin_root_path
      else
        flash[:alert] = "You are not an admin. Nice Try."
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "Username or Password is incorrect"
      redirect_to root_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:alert] = "Successfully Logged out."
    redirect_to root_path
  end

end