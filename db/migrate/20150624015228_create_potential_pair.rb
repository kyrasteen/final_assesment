class CreatePotentialPair < ActiveRecord::Migration
  def change
    create_table :potential_pairs do |t|
      t.integer :requested_id
      t.integer :requester_id
    end
  end
end
