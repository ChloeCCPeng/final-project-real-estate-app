require "test_helper"

class HousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get houses_index_url
    assert_response :success
  end

  test "should get creawte" do
    get houses_creawte_url
    assert_response :success
  end

  test "should get show" do
    get houses_show_url
    assert_response :success
  end

  test "should get update" do
    get houses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get houses_destroy_url
    assert_response :success
  end
end
