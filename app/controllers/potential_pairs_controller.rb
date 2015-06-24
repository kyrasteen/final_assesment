class PotentialPairsController < ApplicationController

  def index
    @potential_pair = PotentialPair.next(current_user)
    if @potential_pair
      if @potential_pair.requested_id == current_user.id
        @pair = User.find(@potential_pair.requester_id)
      else
        @pair = User.find(@potential_pair.requested_id)
      end
    else
      redirect_to root_path
      flash[:notice] = "you have no more suggested pairs at this time"
    end
  end

  def create
  end

  def update
    ppair = current_user.potential_pairs.find_by(requested_id: params[:potential].keys.first)
    if ppair.already_requested?
      pair = User.find(ppair.requested_id)
      Match.make(current_user, pair)
      redirect_to user_potential_pairs_path(current_user)
      flash[:notice] = "Congratulations " + current_user.username + ", you are a match with " + pair.username
    else
      ppair.update_attributes!(accepted: true)
      redirect_to user_potential_pairs_path(current_user)
      flash[:notice] = "Request Saved"
    end
  end

  def remove
    ppair = current_user.potential_pairs.find_by(requested_id: params[:potential].keys.first)
    current_user.potential_pairs.delete(ppair.id)
    redirect_to user_potential_pairs_path(current_user)
    flash[:notice] = "Rejection saved, Ouch!"
  end
end
