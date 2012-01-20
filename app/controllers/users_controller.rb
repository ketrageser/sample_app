class UsersController < ApplicationController
  def new
    @title = "Users"
  end
  
  def show
    @user = User.find(params[:id])
  end

end
