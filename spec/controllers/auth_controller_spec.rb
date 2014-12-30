require 'rails_helper'

RSpec.describe AuthController, :type => :controller do
  let(:valid_credentials) { { username: "ironman", password: "password1" } }
  let(:invalid_credentials) { { username: "ironman", password: "wrong password" } }

  describe "GET hello" do
    it "should return a success status 200" do
      get :hello
      expect(response.status).to eq 200
    end
  end

  describe "POST login" do
    context "valid credentials" do
      before :each do
        post :login, valid_credentials
      end

      it "should return success status 200" do
        expect(response.status).to eq 200
      end

      it "should set the session[userid] and session[session]" do
        expect(session[:userid]).to eq valid_credentials[:username]
        expect(session[:session]).to eq 1
      end
    end

    context "invalid credentials" do
      before :each do
        post :login, invalid_credentials
      end

      it "should return unauthorized status 401" do
        expect(response.status).to eq 401
      end

      it "should not set the session[:userid] and session[:session]" do
        expect(session[:userid]).to eq nil
        expect(session[:session]).to eq nil
      end
    end
  end

  describe "POST logout" do
    before :each do
      post :login, valid_credentials
      post :logout
    end

    it "should clear the session[userid] and session[:session]" do
      expect(session[:userid]).to eq nil
      expect(session[:session]).to eq nil
    end
  end
end
