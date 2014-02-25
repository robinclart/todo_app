class SessionsController < ApplicationController
  skip_before_action :authentication_required, only: [:new, :create]

  # Login Form
  def new
  end

  # Login
  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      cookies.signed.permanent[:user_id] = user.id
      redirect_to root_url
    else
      render :new
    end
  end

  # Logout
  def destroy
    cookies.signed.permanent[:user_id] = nil
    redirect_to new_session_path
  end
end
