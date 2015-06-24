require 'rails_helper'

describe "with valid attributes" do
  it "has valid attributes" do
    user = User.create(username: "kyra", about:"blah")
    user2 = User.create(username: "bill", about:"blah")
    pp = user.potential_pairs.create(requested_id: user2.id)
    expect(pp.requester.id).to eq(user.id)
  end
end
