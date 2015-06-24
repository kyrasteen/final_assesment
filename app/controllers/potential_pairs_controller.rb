class PotentialPairsController < ApplicationController

  def index
    requested_pairs = PotentialPair.where(["requested_id = ? and accepted = ? ", current_user.id, true])
    unrequested_pairs = current_user.potential_pairs.where(accepted: false)
    @potential_pair = (requested_pairs + unrequested_pairs).first
    if @potential_pair
      @pair = User.find(@potential_pair.requested_id)
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
      Match.create(programmer_1: current_user.id, programmer_2: ppair.requested_id)
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
  end
end
