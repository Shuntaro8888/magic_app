class UsersController < ApplicationController
  def new
    @user = User.new
    # Assuming you have a User model and a corresponding view for creating a new user 
  end

  def show
    @user = User.find(params[:id])
    # Assuming you have a User model and a corresponding view for showing user details
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      # Adjust the permitted parameters based on your User model attributes
    end

end