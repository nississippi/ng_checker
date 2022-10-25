require "test_helper"

class Admin::ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_contents_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_contents_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_contents_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_contents_edit_url
    assert_response :success
  end
end
