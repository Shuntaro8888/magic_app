class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

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

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      # Adjust the permitted parameters based on your User model attributes
    end

    # before フィルタ

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location #application controllerでSessinHelperをincludeしてるから使える
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other # →HTTP 303
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end
    
end