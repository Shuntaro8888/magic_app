require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
    get login_path
    assert_select "title", full_title("Log in")
  end

  test "layout links as logged in" do
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", edit_user_path(@user)
    assert_select "a[href=?]", logout_path
    get user_path(@user)
    assert_template 'users/show' # get user_path(@user)は最初から指定したURLを開く処理だからassert_templateを使う
    get edit_user_path(@user)
    assert_template 'users/edit'
    delete logout_path
    assert_redirected_to root_url # delete_logout_pathは最初から指定したURLを開くわけではなくdeleteメソッドlogout_pathにアクセスしdestroyアクションの中でredirectされる
  end

  test "home page displays information" do
    log_in_as(@user)
    get root_path
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'a[href=?]', following_user_path(@user)
    assert_select 'a[href=?]', followers_user_path(@user)
  end
end