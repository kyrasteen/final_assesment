require 'rails_helper'

describe "User" do
  it "has valid attributes" do
    user = User.create(username: "kyra", email:"kw@example.com")
    expect(user).to be_valid
  end

  it "creates its attributes from omniauth's response" do
    data = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid"      => "123456",
      "info" => {
        "email"    => "email@example.com",
        "nickname" => "mock_user",
        "image"    => "mock_user_thumbnail_url"
      },
      "credentials" => {
        "token"  => "mock_token"
      }
    })

    expect { User.find_or_create_from_auth(data) }.to change { User.count }.by(1)
  end
end
