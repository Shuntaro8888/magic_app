class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    # Assuming you have a User model and a corresponding view for showing user details
  end

end