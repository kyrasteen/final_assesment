class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :is_authorized?, :pair_counter

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def is_authorized?(id)
    current_user && current_user.id == (params[:id])
  end

end
