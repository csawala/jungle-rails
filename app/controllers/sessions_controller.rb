class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user
      # success logic, log them in
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_root_url
      else
        redirect_to :root
      end
    else
      # failure, render login form
      redirect_to new_session_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url
  end
end
