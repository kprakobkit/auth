require 'rails_helper'

RSpec.describe User, :type => :model do
  let (:user_hash) { User.get_user_from_file }
  let (:user_ids) { User.get_ids }
  let (:valid_credentials) { { username: "ironman", password: "password1" } }
  let (:invalid_credentials) { { username: "ironman", password: "invalid password" } }

  describe "#get_user_from_file" do
    it "should return a hash" do
      expect(user_hash).to be_a Hash
    end
  end

  describe "#get_ids" do
    it "should return an array of ids" do
      expect(user_ids).to be_a Array
    end
  end

  describe "#valid_credentials?" do
    it "should return true for valid credentials" do
      username = valid_credentials[:username]
      password = valid_credentials[:password]
      expect(User.valid_credentials?(username, password)).to be true
    end

    it "should return false for invalid credentials" do
      username = invalid_credentials[:username]
      password = invalid_credentials[:password]
      expect(User.valid_credentials?(username, password)).to be false
    end
  end
end
