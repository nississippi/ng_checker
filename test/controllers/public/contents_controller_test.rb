require "test_helper"

class Public::ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_contents_index_url
    assert_response :success
  end

  test "should get show" do
    get public_contents_show_url
    assert_response :success
  end
end
