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

  it "has many preferred languages" do
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
    user = User.find_or_create_from_auth(data)

    language = user.languages.create(title: "Ruby")
    expect(language.user_languages.find_by(user_id: user.id).user).to eq(user)
  end

  it "is initially created with a collection of potential pairs" do
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
    user = User.create(username: "sam", email:"kw@example.com")
    user = User.create(username: "bill", email:"bill@example.com")
    user = User.find_or_create_from_auth(data)
    expect(user.potential_pairs.count).to eq(2)
  end
end
