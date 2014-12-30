require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user_ids) { User.get_ids.to_json }
  describe "GET index" do
    before :each do
      get :index
    end

    it "should return a successful status 200" do
      expect(response.status).to eq 200
    end

    it "should return a json response" do
      expect(response.header['Content-Type']).to include 'application/json'
    end

    it "should return the user ids" do
      expect(response.body).to eq user_ids
    end
  end
end
