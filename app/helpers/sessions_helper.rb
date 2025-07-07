module SessionsHelper

  # Logs in the given user by setting the session user_id.
  def log_in(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token # Store the user's session token in the session
  end

  def remember(user)
    user.remember # Call the remember method on the user to set the remember token
    cookies.permanent.encrypted[:user_id] = user.id # Store the user ID in a permanent cookie
    cookies.permanent[:remember_token] = user.remember_token # Store the remember token in a permanent cookie
  end

  def forget(user)
    user.forget # Call the forget method on the user to clear the remember token
    cookies.delete(:user_id) # Remove the user ID from the cookies
    cookies.delete(:remember_token) # Remove the remember token from the cookies
  end

  def log_out
    forget(current_user) # Clear the remember token if the user is logged in
    session.delete(:user_id) # Remove the user_id from the session
    @current_user = nil # Clear the current user instance variable
  end

  # Returns the current logged-in user (if any).
  def current_user
    # 下のコードは比較ではなくローカル変数に代入している
    # ので、比較演算子の `==` ではなく代入演算子の `=` を使用
    if (user_id = session[:user_id]) # Check if the user_id is in the session
      user = User.find_by(id: user_id) # Find the user by ID from the session
      if user && session[:session_token] == user.session_token # Check if the session token matches the user's session token
        @current_user = user # Set the current user instance variable
      end
      # クッキーを見に行く
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user # Log in the user if the remember token is valid
        @current_user = user # Set the current user instance variable
      end
    end
  end

  def current_user?(user)
    user && user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # アクセスしようとしたURLを保存する
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
  
end
