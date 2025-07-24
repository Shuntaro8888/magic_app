class ApplicationController < ActionController::Base
  include SessionsHelper  # Assuming you have a SessionsHelper module for session management

  private
  # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other # Redirects to login page with HTTP 303 status
      end
    end
end