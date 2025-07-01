require "test_helper"

class RememberMeTest < ActionView::TestCase
  include SessionsHelper
  def setup
    @user = users(:michael)
  end

  test "current_user returns correct user when remember_token is valid" do
    token = User.new_token
    digest = User.digest(token)
    @user.update_attribute(:remember_digest, digest)

    cookies.encrypted[:user_id] = @user.id
    cookies[:remember_token] = token

    assert_equal @user, current_user
  end

  test "current_user returns nil when remember_token is invalid" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token)) # Set a valid remember_digest

    cookies.encrypted[:user_id] = @user.id # Set a valid user_id
    cookies[:remember_token] = "invalid" # Set an invalid remember_token

    assert_nil current_user
  end
end
