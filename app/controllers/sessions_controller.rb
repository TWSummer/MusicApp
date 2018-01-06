class SessionsController < ApplicationController
  before_action :ensure_logged_out, only: [:new, :create]
  
    def new
      render :new
    end

    def create
      user = User.find_by_credentials(session_params)
      if user
        log_in_user!(user)
        redirect_to user_url(user)
      else
        flash.now[:errors] = ["Email or password incorrect."]
        render :new
      end
    end

    def destroy
      user = User.find_by(session_token: session[:session_token])
      user.reset_session_token! if user
      session.delete(:session_token)
      redirect_to new_session_url
    end

    private

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
