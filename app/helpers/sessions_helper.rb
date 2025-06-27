module SessionsHelper

  # Logs in the given user by setting the session user_id.
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id) # Remove the user_id from the session
    @current_user = nil # Clear the current user instance variable
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
end
