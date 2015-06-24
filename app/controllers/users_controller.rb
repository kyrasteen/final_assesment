class UsersController < ApplicationController
  before_action :user

  def show
    if is_authorized?(user.id)
      redirect_to root_path
    else
      redirect_to root_path
      flash[:error] = "Not Authorized"
    end
  end

  def edit
    @languages = Language.all
  end

  def update
    user.update_attributes!(about: params[:user][:about])
    user.add_preferred_languages(params[:language].keys) if params[:langauge]
    if user.save
      redirect_to  root_path(user)
    else
      redirect_to :back
      flash[:error] = "something went wrong"
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

end
