class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:requested_url] || root_path
    else
      redirect_to login_path, alert: 'Are you Guru? Verify your Email and Password!'
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:requested_url)
    redirect_to login_path
  end
end
