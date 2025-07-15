class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] # Check expiration of reset token

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticated?(:reset, params[:id]) && @user.reset_sent_at > 2.hours.ago
      # パスワード再設定の有効期限が切れていない場合
    else
      flash[:danger] = 'Invalid password reset link'
      redirect_to new_password_reset_url
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit', status: :unprocessable_entity
    elsif @user.update(user_params)
      @user.forget # Clear the remember digest
      @user.update_attribute(:reset_digest, nil) # Clear the reset digest 追加した（2時間で有効期限切れるが念押し）
      reset_session
      log_in @user
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # before filters
    def get_user
      @user = User.find_by(email: params[:email])
    end
    
    # Confirms a valid user.
    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    def check_expiration
      if @user.reset_sent_at < 2.hours.ago
        flash[:danger] = 'Password reset has expired'
        redirect_to new_password_reset_url
      end
    end

end
