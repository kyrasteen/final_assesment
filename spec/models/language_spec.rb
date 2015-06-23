require 'rails_helper'

describe "Language" do
  it "has a title" do
    language = Language.create(title: "Ruby")
    expect(language).to be_valid
  end
end
