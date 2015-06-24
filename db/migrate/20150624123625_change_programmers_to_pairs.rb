class ChangeProgrammersToPairs < ActiveRecord::Migration
  def change
    remove_column :matches, :programmer1_id
    remove_column :matches, :programmer2_id
    add_column :matches, :first_accepter_id, :integer
    add_column :matches, :second_accepter_id, :integer
  end
end
