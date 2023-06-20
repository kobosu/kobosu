require "test_helper"

class GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genres_index_url
    assert_response :success
  end

  test "should get create" do
    get genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get genres_update_url
    assert_response :success
  end
end
