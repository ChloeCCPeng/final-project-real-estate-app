require "test_helper"

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get watchlists_index_url
    assert_response :success
  end

  test "should get create" do
    get watchlists_create_url
    assert_response :success
  end

  test "should get show" do
    get watchlists_show_url
    assert_response :success
  end

  test "should get update" do
    get watchlists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get watchlists_destroy_url
    assert_response :success
  end
end
