require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get signup_path
    assert_select "title", full_title("Sign up")
  end
end

# This test checks that the layout links on the home page are correct.
# It ensures that the root path is linked twice (once in the header and once in the footer),
# and that the help, about, and contact paths are linked correctly.
# The `assert_template` method checks that the correct template is rendered for the home page.
# The `assert_select` method checks that the specified links are present in the HTML response.
# The `count: 2` argument for the root path ensures that there are two links to the root path,
# which is typical in a Rails application (one in the header and one in the footer).
