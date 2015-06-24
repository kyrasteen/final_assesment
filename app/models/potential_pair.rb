class PotentialPair < ActiveRecord::Base
  belongs_to :requester, class_name: :User, foreign_key: "requester_id"
  belongs_to :requested, class_name: :User, foreign_key: "requested_id"

  def already_requested?
    accepted == true
  end

  def self.next(current_user)
    requested_pairs   = where(["requested_id = ? and accepted = ? ", current_user.id, true])
    unrequested_pairs = where(["requester_id = ? and accepted = ? ", current_user.id, false])
    (requested_pairs  + unrequested_pairs).first
  end

end
