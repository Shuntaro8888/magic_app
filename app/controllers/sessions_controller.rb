class SessionsController < ApplicationController
  def new # ログインフォーム
  end

  def create #ログインメソッド
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      # Log the user in and redirect to their profile page
      forwarding_url = session[:forwarding_url]
      reset_session # Clear any existing session data ログインの直前に書く（セッション固定対策）
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user) # Remember the user if the checkbox is checked 三項演算子
      log_in @user
      redirect_to forwarding_url || @user
    else
      # Create an error message and re-render the signin form
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in? # Ensure the user is logged out before redirecting
    redirect_to root_url, status: :see_other
  end

end