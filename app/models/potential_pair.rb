class PotentialPair < ActiveRecord::Base
  belongs_to :requester, class_name: :User, foreign_key: "requester_id"
  belongs_to :requested, class_name: :User, foreign_key: "requested_id"

  def self.find_next_user(current_user, count)
  end

end
