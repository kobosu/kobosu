require "test_helper"

class OrderItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get order_items_update_url
    assert_response :success
  end
end
