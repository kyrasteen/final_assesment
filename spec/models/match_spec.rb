require 'rails_helper'

describe "Match" do
  it "has valid attributes" do
    user = User.create(username: "kyra", about:"blah")
    user2 = User.create(username: "bill", about:"blah")
    match = Match.create(first_accepter_id: user.id, second_accepter_id: user2.id)
    expect(match).to be_valid
  end

  it "is associated with programmers" do
    user = User.create(username: "kyra", about:"blah")
    user2 = User.create(username: "bill", about:"blah")
    match = Match.create(first_accepter_id: user.id, second_accepter_id: user2.id)
    expect(user.matches.first).to eq(match)
    expect(match.second_accepter).to eq(user2)
  end
end

