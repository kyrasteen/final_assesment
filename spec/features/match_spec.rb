require 'rails_helper'

describe "match" do
  xit "once found, does not show as potential pair for either users again" do
    Language.create(title: "Ruby")
    User.create(username: "Joe", provider: "github", uid: "3245")
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
    fill_in("user[about]", with: "i like pizza")
    check("Ruby")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")
    expect(page).to have_content("Joe")
    click_link_or_button("Approve")
    click_link_or_button('logout')

    visit root_path
    click_link_or_button("login with GitHub")
    fill_in("user[about]", with: "i like pie")
    check("Ruby")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")
    expect(page).to have_content("Kyra_Steen")
  end

end
