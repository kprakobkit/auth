class AuthController < ApplicationController
  def hello
    response = { hello: "world" }

    render status: 200, json: response
  end

  def login
    username = params["username"]
    password = params["password"]

    if User.valid_credentials?(username, password)
      session[:userid] = username
      session[:session] = 1
      render status: 200, nothing: true
    else
      render status: 401, nothing: true
    end
  end

  def logout
    session[:userid] = nil
    session[:session] = nil
  end
end
