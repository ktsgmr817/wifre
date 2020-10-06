class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def index
    @users = User.where(university: current_user.university)    
  end
end
