require 'rails_helper'

RSpec.describe User, type: :model do
  it "validates the presence of a username" do
    user = User.new(username: nil)
    expect(user).not_to be_valid
  end

  it "validates the uniqueness of usernames" do
    existing_user = User.create(username: "alice")
    new_user = User.new(username: "alice")
    expect(new_user).not_to be_valid
  end

  it "validates the presence of an email" do
    user = User.new(email: nil)
    expect(user).not_to be_valid
  end

  it "validates the uniqueness of email" do
    existing_user = User.create(email: "user@example.com")
    new_user = User.new(email: "user@example.com")
    expect(new_user).not_to be_valid
  end
end
