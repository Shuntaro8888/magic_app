class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to their profile page
      reset_session # Clear any existing session data ログインの直前に書く（セッション固定対策）
      log_in user
      redirect_to user
    else
      # Create an error message and re-render the signin form
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end

end
