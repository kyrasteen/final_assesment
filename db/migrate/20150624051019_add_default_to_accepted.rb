class AddDefaultToAccepted < ActiveRecord::Migration
  def change
    remove_column :potential_pairs, :accepted
    add_column :potential_pairs, :accepted, :boolean, default: false
  end
end
