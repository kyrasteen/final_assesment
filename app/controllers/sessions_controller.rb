class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "something went wrong"
      redirect_to :back
    end
  end
end
