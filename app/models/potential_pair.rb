class PotentialPair < ActiveRecord::Base
  belongs_to :requester, class_name: :User, foreign_key: "requester_id"
  belongs_to :requested, class_name: :User, foreign_key: "requested_id"

  def already_requested?
    accepted == true
  end

end
