require "test_helper"

class SearchEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_entries_index_url
    assert_response :success
  end
end
