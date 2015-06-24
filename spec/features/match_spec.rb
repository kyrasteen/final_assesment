require 'rails_helper'

describe "match" do
  it "is made" do
    user  = User.create(username: "betty", about: "i am a girl")
    Language.create(title: "Ruby")

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

    auth_user = User.find_or_create_from_auth(data)
    ppair = PotentialPair.where(requester_id: auth_user.id, requested_id: user.id)
    ppair.first.update_attributes!(accepted: true)

    visit root_path
    click_link_or_button("login with GitHub")
    fill_in("user[about]", with: "i like pizza")
    check("Ruby")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")
    click_link_or_button("Approve")

    expect(page).to have_content("Congratulations")
  end
end
