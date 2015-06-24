require 'rails_helper'

describe "Find Pairs" do

  it "is taken to pairs page from dashboard" do
    Language.create(title: "Ruby")
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

    expect(page).to have_content("Find Pairs")
  end

  it "shows potential pairs on pair index page" do
    user = User.create(username: "betty", about: "i am a girl")
    user.languages.create(title: "Ruby")
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

    expect(page).to have_content(user.username.capitalize)
    expect(page).to have_content(user.about)
    expect(page).to have_content("Ruby")
  end

  it "can approve pair" do
    Language.create(title: "Ruby")
    User.create(username: "betty", about: "i am a girl")
    user2 = User.create(username: "joe", about: "i am a boy")

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
    click_link_or_button("Approve")
    expect(page).to have_content(user2.username.capitalize)
  end

  it "can reject pair" do
    Language.create(title: "Ruby")
    User.create(username: "betty", about: "i am a girl")
    User.create(username: "joe", about: "i am a boy")

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
    click_link_or_button("Reject")
    expect(page).to have_content("Rejection saved")
  end

  it "sees pairs first that have already requested them" do
    user = User.create(username: "betty", about: "i am a girl")
    User.create(username: "joe", about: "i am a boy")
    Language.create(title: "Ruby")

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
    expect(page).to have_content(user.username.capitalize)
  end
end
