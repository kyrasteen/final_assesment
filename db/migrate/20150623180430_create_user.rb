class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :provider
      t.string :uid
      t.string :token
      t.string :image_url
      t.string :email
    end
  end
end
