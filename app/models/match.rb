class Match < ActiveRecord::Base
  belongs_to :first_accepter, class_name: :User, foreign_key: "first_accepter_id"
  belongs_to :second_accepter, class_name: :User, foreign_key: "second_accepter_id"

  def secondary_accepter
    User.find(second_accepter_id).username
  end
end
