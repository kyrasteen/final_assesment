require 'rails_helper'

describe "User" do
  context "through github" do
    xit "on root page is prompted to login" do

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

      visit root_path
      click_link_or_button("login with GitHub")
      expect(page).to have_content("Welcome to Pairr")
    end
  end

  xit "can logout after login" do
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

    visit root_path
    click_link_or_button("login with GitHub")
    expect(current_path).to eq(user_path(user))
    click_link_or_button("logout")
    expect(page).to have_content("login")
  end
end
