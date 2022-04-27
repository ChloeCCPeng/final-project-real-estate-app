require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get offers_create_url
    assert_response :success
  end

  test "should get show" do
    get offers_show_url
    assert_response :success
  end

  test "should get update" do
    get offers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get offers_destroy_url
    assert_response :success
  end
end
