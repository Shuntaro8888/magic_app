require "test_helper"

class UsersLogin < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
end

class InvalidPasswordTest < UsersLogin
  test "login path" do
    get login_path
    assert_template 'sessions/new'
  end

  test "login with valid email/invalid password" do
    # Attempt to log in with valid email but invalid password
    post login_path, params: { session: { email: @user.email, password: "invalid" } }
    assert_not is_logged_in?
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end

class ValidLogin < UsersLogin
  def setup
    super # @userの継承に必要
    post login_path, params: { session: { email: @user.email, password: 'password' } }
  end
end

class ValidLoginTest < ValidLogin
  test "valid login" do
    assert is_logged_in?       # Check if the user is logged in
    assert_redirected_to @user # Redirect to user profile after successful login
  end

  test "redirect after login" do
    follow_redirect!             # Follow the redirect to the user profile page
    assert_template 'users/show' # Ensure the user profile page is rendered
    assert_select "a[href=?]", login_path, count: 0 # No login link should be present
    assert_select "a[href=?]", logout_path          # Logout link should be present
    assert_select "a[href=?]", user_path(@user)     # User profile link should be present
  end
end

class Logout < ValidLogin
  def setup
    super
    delete logout_path # Log out the user
  end
end

class LogoutTest < Logout
  test "successful logout" do
    assert_not is_logged_in?      # Check if the user is logged out
    assert_response :see_other    # Ensure the response is a redirect
    assert_redirected_to root_url # Redirect to the root URL after logout
  end

  test "redirect after logout" do
    follow_redirect!
    assert_select "a[href=?]", login_path                 # Login link should be present
    assert_select "a[href=?]", logout_path,      count: 0 # Logout link should not be present
    assert_select "a[href=?]", user_path(@user), count: 0 # User profile link should not be present
  end

  test "should still work after logout in second window" do
    delete logout_path
    assert_redirected_to root_url
  end
end

class RememberingTest < UsersLogin

  test "login with remembering" do
    log_in_as(@user, remember_me: '1') # Log in with the remember me option checked
    assert_equal cookies[:remember_token], assigns(:user).remember_token # Check if the remember token cookie is set
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '1')     # Log in with the remember me option checked
    log_in_as(@user, remember_me: '0')     # Log in again without the remember me option
    assert cookies[:remember_token].blank? # Ensure the remember token cookie is not set
  end
end