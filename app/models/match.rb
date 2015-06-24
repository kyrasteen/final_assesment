class Match < ActiveRecord::Base
  belongs_to :programmer1, class_name: :User, foreign_key: "programmer1_id"
  belongs_to :programmer2, class_name: :User, foreign_key: "programmer2_id"
end
