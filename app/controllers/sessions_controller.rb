class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      if user.languages.empty?
        redirect_to edit_user_path(user)
      else
        redirect_to user_path(user)
      end
    else
      flash[:error] = "something went wrong"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
end
