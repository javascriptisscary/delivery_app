class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :require_login, only: [:create], raise: false
  
  def create
    if @user = User.valid_login(params[:email], params[:password]) #if user json params correct, create a login token and send it.
      allow_token_to_be_used_only_once_for(@user)
      send_auth_token_for_valid_login_of(@user)
    else
      render_unauthorized("Login Error: User email or password incorrect")
    end
  end
  
  def destroy
    current_user.logout
    head :ok
  end
  
  private

  def allow_token_to_be_used_only_once_for(user)
    user.regenerate_token #rails function
  end

  def send_auth_token_for_valid_login_of(user)
    render json: { token: user.token, user: {id: user.id, email: user.email} }
  end

end