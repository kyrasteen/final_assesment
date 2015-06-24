require 'rails_helper'

describe "Find Pairs" do
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

  it "is taken to pairs page from dashboard" do
    fill_in("user[about]", with: "i like pizza")
    check("Ruby")
    click_link_or_button("Save My Info")

    expect(page).to have_content("Find Pairs")
  end

  it "shows potential pairs on pair index page" do
    user = User.create(username: "betty", about: "i am a girl")
    user.languages.create(title: "Ruby")

    fill_in("user[about]", with: "i like pizza")
    check("Java")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")

    expect(page).to have_content(user.username)
    expect(page).to have_content(user.about)
    expect(page).to have_content("Ruby")
  end

  it "can approve pair" do
    User.create(username: "betty", about: "i am a girl")
    user2 = User.create(username: "joe", about: "i am a boy")

    fill_in("user[about]", with: "i like pizza")
    check("Java")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")
    click_link_or_button("Approve")
    expect(page).to have_content(user2.username)
  end

  it "can reject pair" do
    User.create(username: "betty", about: "i am a girl")
    user2 = User.create(username: "joe", about: "i am a boy")

    fill_in("user[about]", with: "i like pizza")
    check("Java")
    click_link_or_button("Save My Info")
    click_link_or_button("Find Pairs")
    click_link_or_button("Reject")
    expect(page).to have_content("Rejected!")
  end
end
