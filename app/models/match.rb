class Match < ActiveRecord::Base
  belongs_to :first_accepter, class_name: :User, foreign_key: "first_accepter_id"
  belongs_to :second_accepter, class_name: :User, foreign_key: "second_accepter_id"

  def secondary_accepter
    User.find(second_accepter_id)
  end

  def self.make(current_user, pair_to_match)
    match = current_user.matches.create(second_accepter_id: pair_to_match.id)
    match.remove_from_potential_pairing
  end

  def remove_from_potential_pairing
    first_sequence = first_accepter.potential_pairs.where(requested_id: secondary_accepter.id).first
    second_sequence = secondary_accepter.potential_pairs.where(requested_id: first_accepter.id).first
    PotentialPair.delete([first_sequence.id, second_sequence.id])
  end
end
