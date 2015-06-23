require 'rails_helper'

describe "User Authorization" do
  it "cannot visit another users dashboard" do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      'provider' => 'github',
      'uid' => "2328988092",
      'info' => {
        'nickname' => 'Kyra_Steen',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
      }
    })

    user2 = User.create(username: "john")

    visit root_path
    click_link_or_button("login with GitHub")

    visit user_path(user2)
    expect(page).to have_content("Not Authorized")
    expect(current_path).to eq(root_path)
  end
end
