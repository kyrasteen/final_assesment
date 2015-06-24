require 'rails_helper'

describe "User information" do
  before(:each) do
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
  end

  it "is collected upon first login" do
    fill_in("user[about]", with: "i like pizza")
    check("Ruby")
    click_link_or_button("Save My Info")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Dashboard")
  end
end
