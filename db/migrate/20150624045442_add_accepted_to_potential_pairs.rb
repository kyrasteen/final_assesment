class AddAcceptedToPotentialPairs < ActiveRecord::Migration
  def change
    add_column :potential_pairs, :accepted, :boolean
  end
end
