require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "create should require logged-in user" do
    assert_no_difference 'Relationship.count' do # no change
      post relationships_path # attempt to create a relationship without being logged in
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Relationship.count' do # no change
      delete relationship_path(relationships(:one)) # attempt to destroy a relationship without being logged in
    end
    assert_redirected_to login_url
  end
end
