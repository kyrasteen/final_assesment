class CreateMatch < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :programmer1_id
      t.integer :programmer2_id
    end
  end
end
