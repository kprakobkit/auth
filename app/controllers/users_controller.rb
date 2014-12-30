class UsersController < ApplicationController
  def index
    @user = User.get_ids

    render status: 200, json: @user
  end
end
