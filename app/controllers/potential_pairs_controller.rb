class PotentialPairsController < ApplicationController

  def index
    @potential_pair = current_user.potential_pairs.first
    @pair = User.find(@potential_pair.requested_id)
  end

  def create
  end

  def update
    ppair = current_user.potential_pairs.find_by(requested_id: params[:potential].keys.first)
    ppair.update_attributes!(accepted: true)
    if ppair.save
      redirect_to user_potential_pairs_path(current_user)
      flash[:notice] = "Request Saved"
    else
      redirect_to :back
      flash[:notice] = "something went wrong"
    end
  end

  def remove

  end
end
