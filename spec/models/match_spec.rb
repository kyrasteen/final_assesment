require 'rails_helper'

describe "Match" do
  it "has valid attributes" do
    user = User.create(username: "kyra", about:"blah")
    user2 = User.create(username: "bill", about:"blah")
    match = Match.create(programmer1_id: user.id, programmer2_id: user2.id)
    expect(match).to be_valid
  end

  it "is associated with programmers" do
    user = User.create(username: "kyra", about:"blah")
    user2 = User.create(username: "bill", about:"blah")
    match = Match.create(programmer1_id: user.id, programmer2_id: user2.id)
    expect(user.matches.first).to eq(match)
    expect(match.programmer2).to eq(user2)
  end
end

